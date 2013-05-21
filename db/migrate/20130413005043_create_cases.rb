class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :name
      t.string :url
      t.text :info
      t.string :min_image

      t.timestamps
    end
  end
end
