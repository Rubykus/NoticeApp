class AddColorToNotice < ActiveRecord::Migration
  def change
    add_column :notices, :color, :string
  end
end
