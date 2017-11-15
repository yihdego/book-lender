class CreateShelves < ActiveRecord::Migration[5.1]
  def change
    create_table :shelves do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.boolean :shared, default: false
      t.integer :friend_id, default: nil
      t.string :friend_name, default: nil
      t.timestamps
    end
  end
end
