class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notices, dependent: :destroy
  has_many :categories
  has_many :friends
  validates :username, presence: true
  mount_uploader :avatar, AvatarUploader
  default_scope -> { order(created_at: :desc) }
end
