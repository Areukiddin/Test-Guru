class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :tests, dependent: :destroy

  def results_list_by(level)
    Test.joins(:results)
        .where(results: { user_id: id }, level: level)
  end
end
