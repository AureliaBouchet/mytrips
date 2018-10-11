class Hotel < ApplicationRecord
  validates :price, inclusion: { in: ['','€', '€€', '€€€'] }

  belongs_to :step
end
