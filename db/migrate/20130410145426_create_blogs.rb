class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.integer :user_id
      t.boolean :is_top
      t.integer :status
      t.string :cover
      t.string :tags

      t.timestamps
    end
  end
end
