class AddUserIdToNotice < ActiveRecord::Migration
  def change
    add_reference :notices, :user, index: true, foreign_key: true
  end
end
