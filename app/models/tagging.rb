class Tagging < ActiveRecord::Base
  belongs_to :notice
  belongs_to :tag
end
