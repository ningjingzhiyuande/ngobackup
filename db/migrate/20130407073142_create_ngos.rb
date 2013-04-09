class CreateNgos < ActiveRecord::Migration
  def change
    create_table :ngos do |t|
      t.string :name
      t.text :info
      t.integer :position

      t.timestamps
    end
  end
end
