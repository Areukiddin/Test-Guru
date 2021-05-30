class User < ApplicationRecord
  has_many :tests, foreign_key: :author_id, dependent: :destroy, inverse_of: :author
  has_many :results, foreign_key: :user_id, dependent: :destroy

  def results_list_by(level)
    complete_test_id = results.where(user_id: self.id).pluck(:test_id)
    tests.where(id: complete_test_id, level: level)
  end
end
