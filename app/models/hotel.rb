class Hotel < ApplicationRecord
  validates :price, inclusion: { in: ['','€', '€€', '€€€'] }
  validates :rating, inclusion: { in: [1, 2, 3, 4] }
  validates :address, presence: true

  belongs_to :step

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

def blank_stars
 4 - rating.to_i
end
end
