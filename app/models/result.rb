class Result < ApplicationRecord
  belongs_to :user, inverse_of: :results
  belongs_to :test, inverse_of: :results
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create
  before_update :set_next_question

  SUCCESS_TRESHOLD = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_answers += 1 if correct_answer?(answer_ids)
    save!
  end

  def success_result?
    correct_answers_percent.to_i >= SUCCESS_TRESHOLD
  end

  def correct_answers_percent
    (self.correct_answers.to_f / self.test.questions.each { |q| q.answers.correct }.count * 100).to_i
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  private

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
    self.current_question = test.questions.order(:id).find_by('id > ?', current_question.id)
  end
end
