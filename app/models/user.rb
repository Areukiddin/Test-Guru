class User < ApplicationRecord
  has_many :results, inverse_of: :user, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :author, dependent: :destroy

  def results_list_by(level)
    Test.joins(:results)
        .where(results: { user_id: id }, level: level)
  end
end
