class CreateRichTexts < ActiveRecord::Migration
  def change
    create_table :rich_texts do |t|
      t.integer :user_id
      t.string :token
      t.integer :status ,:default=>0 
      t.text :content
      t.timestamps
    end
  end
end
