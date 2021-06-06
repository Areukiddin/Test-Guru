class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: :tests

  has_many :questions, dependent: :destroy
  has_many :results, inverse_of: :test, dependent: :destroy
  has_many :users, through: :results

  def self.titles_by(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
