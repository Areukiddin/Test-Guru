class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.titles_by(category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
