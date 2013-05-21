class Asset < ActiveRecord::Base
  attr_accessible :avatar, :item_id, :item_type
  belongs_to :item, :polymorphic => true
  mount_uploader :avatar,  ::AssetUploader
  
  def to_jq_upload
    
    {
      "name" => read_attribute(:avatar),
      "size" => read_attribute(:avatar),
      "url" => avatar.url,
      "delete_url" => "/admin/assets/#{id}",
      "delete_type" => "DELETE" 
    }
  end
end
