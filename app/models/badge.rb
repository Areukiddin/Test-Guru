class Badge < ApplicationRecord
  has_many :own_badges, inverse_of: :badge, dependent: :destroy

  validates :title, presence: true
  validates :achieved_for, presence: true

  def self.category_badge_kind(test)
    return 'All Frontend tests passed' if test.category.title.eql?('Frontend')
    return 'All Backend tests passed' if test.category.title.eql?('Backend')
  end

  def self.level_badge_kind(test)
    return 'All easy tests passed' if test.level.eql?(0) || test.level.eql?(1)
    return 'All medium tests passed' if test.level.eql?(2) || test.level.eql?(3) || test.level.eql(4)

    'All hard tests passed'
  end
end
