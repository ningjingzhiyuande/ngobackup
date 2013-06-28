# encoding: utf-8
class AssetUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  #  include CarrierWave::Compatibility::Paperclip
  include Piet::CarrierWaveExtension
  #include CarrierWave::RMagick
  #process :optimize

  storage :file

  def store_dir
    "upload/assets/#{model.id}"
  end

  #  def paperclip_path
  #    ":rails_root/public/upload/corps/logo/:id_partition/:style.:extension"
  #  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    #"/images/company_login/logo.png"
    default_dir = "/images/default"
    case version_name.to_s
    when 'medium'
      "#{default_dir}/image-1.jpg"
    when 'feed'
      "#{default_dir}/image-2.jpg"
    else
      "#{default_dir}/image-3.jpg"
    end
  end

  # 公司主页
  version :blog_large do
   # process :manualcrop
    process resize_to_fill: [630, 300]
  end

  version :blog_small do
   # process :manualcrop
    process resize_to_fill: [420, 242]
  end

  version :cases_large do
   # process :manualcrop
    process resize_to_fill: [570, 270]
  end

  version :case_small do
   # process :manualcrop
    process resize_to_fill: [420, 242]
  end


  #version :feed do
  #  process :manualcrop
  #  process resize_to_fill: [45, 50]
  #end

  
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    @name ||= "#{md5}.#{file.extension}" if original_filename.present?
  end

  protected
  def md5
    var = :"@#{mounted_as}_md5"
    model.instance_variable_get(var) or model.instance_variable_set(var, ::Digest::MD5.file(current_path).hexdigest)
    #    model.instance_variable_get(var) or model.instance_variable_set(var, rand(1000))
  end
end
