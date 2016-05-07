class Notice < ActiveRecord::Base
  validates :title, :body, presence: true
  belongs_to :user
  delegate :username, to: :user
end
