class Trip < ApplicationRecord
  validates :title, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true

  has_many :steps, dependent: :destroy
  has_many :restaurants, through: :steps
  has_many :bars, through: :steps
  has_many :hotels, through: :steps
  has_many :activities, through: :steps

  mount_uploader :photo, PhotoUploader
end
