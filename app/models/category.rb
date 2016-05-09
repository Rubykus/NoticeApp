class Category < ActiveRecord::Base
  belongs_to :user
  has_many :notices
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 40 }
end
