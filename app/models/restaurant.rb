class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :price, inclusion: { in: ['','€', '€€', '€€€'] }
  belongs_to :step
end
