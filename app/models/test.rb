class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: :tests

  has_many :questions, dependent: :destroy
  has_many :results, inverse_of: :test, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, uniqueness: { scope: :title }
  validates :minutes_for_passing, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :titles_by, ->(category) { joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title) }
  scope :tests_by, ->(category) { joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:id) }
end
