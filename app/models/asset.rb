class Asset < ActiveRecord::Base
  attr_accessible :image, :item_id, :item_type
  belongs_to :attachable, :polymorphic => true
end
