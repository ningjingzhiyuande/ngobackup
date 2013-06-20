class Blog < ActiveRecord::Base
  attr_accessible :category_id, :content, :tags, :title, :user_id,:is_top,:status,:cover
  as_enum :category, ["分享", "农业", "科技"],:column=>:category_id
  blongs_to :user
  mount_uploader :cover,  ::CoverUploader
end
