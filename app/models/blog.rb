class Blog < ActiveRecord::Base
  attr_accessible :category_id, :content, :tags, :title, :user_id,:is_top,:status,:cover
  as_enum :category, ["公益","技术","情感"],:column=>:category_id
  belongs_to :user
  mount_uploader :cover,  ::CoverUploader
end
