class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: :user

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  def self.titles_by(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
