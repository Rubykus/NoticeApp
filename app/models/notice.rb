class Notice < ActiveRecord::Base
  validates :title, :body, presence: true

  belongs_to :category
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  delegate :username, to: :user

  default_scope -> { order(created_at: :desc) }
  COLOR_NOTICE = ["red", "yellow", "green"]

  def self.tagged_with(name)
    Tag.find_by!(name: name).notices
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.downcase).first_or_create!
    end
  end

  def all_tags
    tags.collect{|tag| tag.name.lstrip}.uniq.join(",")
  end

end
