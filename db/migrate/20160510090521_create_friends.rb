class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :relation
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
