class Badge < ApplicationRecord
  has_many :own_badges, inverse_of: :badge, dependent: :destroy

  validates :title, presence: true
  validates :rule, presence: true

  BADGE_TYPES = %w[all_category_tests_passed first_try_passed all_level_tests_passed].freeze
end
