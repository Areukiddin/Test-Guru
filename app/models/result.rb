class Result < ApplicationRecord
  belongs_to :user, inverse_of: :results, dependent: :destroy
  belongs_to :test, inverse_of: :results, dependent: :destroy
end
