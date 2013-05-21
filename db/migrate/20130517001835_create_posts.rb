class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :email
      t.text :content
      t.integer :item_id
      t.string :item_type
      t.integer :status

      t.timestamps
    end
  end
end
