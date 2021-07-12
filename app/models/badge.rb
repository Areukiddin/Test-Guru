class Badge < ApplicationRecord
  has_many :own_badges, inverse_of: :badge, dependent: :destroy
end
