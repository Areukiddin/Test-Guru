class OwnBadge < ApplicationRecord
  belongs_to :user, inverse_of: :own_badges
  belongs_to :badge, inverse_of: :own_badges
end
