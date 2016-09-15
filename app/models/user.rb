class User < ApplicationRecord
  has_many :tags
  has_many :images
  has_many :tagged_images, through: :tags, dependent: :destroy, source: :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :username
end
