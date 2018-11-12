class Step < ApplicationRecord
  belongs_to :trip
  has_many :hotels, dependent: :destroy
  has_many :bars, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  has_many :activities, dependent: :destroy

  validates :address, presence: true
  validates :photo, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo, PhotoUploader
end
