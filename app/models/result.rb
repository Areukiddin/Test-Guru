class Result < ApplicationRecord
  belongs_to :user, inverse_of: :results
  belongs_to :test, inverse_of: :results
  belongs_to :current_question, class_name: 'Question', optional: true, dependent: :destroy
end
