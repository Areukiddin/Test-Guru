class Result < ApplicationRecord
  belongs_to :user, inverse_of: :results
  belongs_to :test, inverse_of: :results
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create

  SUCCESS_TRESHOLD = 85

  scope :success_passed, -> { where('passage_percent >= ?', SUCCESS_TRESHOLD) }

  def completed?
    current_question.nil? || times_up?
  end

  def accept!(answer_ids)
    return if times_up?

    self.correct_answers += 1 if correct_answer?(answer_ids)
    self.current_question = set_next_question
    save!
  end

  def success_result?
    correct_answers_percent.to_i >= SUCCESS_TRESHOLD
  end

  def correct_answers_percent
    self.correct_answers.zero? ? 0 : (self.correct_answers.to_f / self.test.questions.each { |q| q.answers.correct }.count * 100).to_i
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  def calculate_passage_percent
    update!(passage_percent: correct_answers_percent)
  end

  def times_up?
    times_up <= Time.current
  end

  def left_time
    time = times_up - Time.current
    time.positive? ? time : 0
  end

  private

  def times_up
    created_at + test.minutes_for_passing.minutes
  end

  def set_first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    test_correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def test_correct_answers
    current_question.answers.correct
  end

  def set_next_question
    test.questions.order(:id).find_by('id > ?', self.current_question.id)
  end
end
