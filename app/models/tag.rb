class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :notices, through: :taggings
  default_scope -> { order(created_at: :desc) }
end
