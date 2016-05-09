class AddCatKeyToNotices < ActiveRecord::Migration
  def change
    add_reference :notices, :category, index: true, foreign_key: true
  end
end
