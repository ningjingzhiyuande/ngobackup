class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :item_id
      t.string :item_type
      t.string :avatar

      t.timestamps
    end
  end
end
