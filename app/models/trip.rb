class Trip < ApplicationRecord
  validates :address, presence: true
  validates :date_begin, presence: true
  validates :date_end, presence: true
  validates :photo, presence: true

  has_many :tips, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_many :restaurants, through: :steps
  has_many :bars, through: :steps
  has_many :hotels, through: :steps
  has_many :activities, through: :steps

  belongs_to :user

  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :global_search,
  against: :address,
  associated_against: {
      steps: [:address]
    },
  using: {
    :tsearch => {:prefix => true},
    }

end
