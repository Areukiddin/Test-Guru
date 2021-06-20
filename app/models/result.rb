class Result < ApplicationRecord
  belongs_to :user, inverse_of: :results
  belongs_to :test, inverse_of: :results
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_first_question, on: :create
  before_update :set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_answers += 1 if correct_answer?(answer_ids)
    save!
  end

  private

  def set_first_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = test_correct_answers.count

    (correct_answers_count == test_correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def test_correct_answers
    current_question.answers.correct
  end

  def set_next_question
    self.current_question = test.questions.order(:id).find_by('id > ?', current_question.id)
  end
end
