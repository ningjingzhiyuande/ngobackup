class Post < ActiveRecord::Base
  attr_accessible :content, :email, :item_id, :item_type, :name, :status
  belongs_to :item, :polymorphic => true
end
