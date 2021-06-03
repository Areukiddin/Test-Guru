class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def results_list_by(level)
    Test.joins('LEFT JOIN results ON tests.id = results.test_id')
        .where(results: { user_id: id }, level: level)
  end
end
