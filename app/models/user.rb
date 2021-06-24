class User < ApplicationRecord
  has_many :results, inverse_of: :user, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :author, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def results_list_by(level)
    Test.joins(:results)
        .where(results: { user_id: id }, level: level)
  end

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
