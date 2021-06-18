class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  attr_reader :answers

  def validate_answers_count
    errors.add(:answers, message: "can't be more the 4") if question.answers.count >= 4
  end
end
