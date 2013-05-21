class Case < ActiveRecord::Base
  attr_accessible :info, :name, :url,:min_image
  has_many :assets, :as => :item , :dependent => :destroy

  mount_uploader :min_image,  ::AssetUploader

  
end
