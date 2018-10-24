class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :name, uniqueness: true

  has_many :trips
  has_many :steps, through: :trips

  mount_uploader :photo, PhotoUploader
end
