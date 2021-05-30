class Result < ApplicationRecord
  has_many :tests, foreign_key: :test_id, dependent: :destroy
  has_many :users, foreign_key: :users_id, dependent: :destroy
end
