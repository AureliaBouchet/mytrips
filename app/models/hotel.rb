class Hotel < ApplicationRecord
  validates :price, inclusion: { in: ['','€', '€€', '€€€'] }

  belongs_to :step

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
