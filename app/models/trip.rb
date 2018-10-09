class Trip < ApplicationRecord
  validates :title, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true

  has_many :steps

  mount_uploader :photo, PhotoUploader
end
