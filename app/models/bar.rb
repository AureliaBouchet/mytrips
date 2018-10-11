class Bar < ApplicationRecord
  validates :price, inclusion: { in: ['','€', '€€', '€€€'] }
  belongs_to :step
end
