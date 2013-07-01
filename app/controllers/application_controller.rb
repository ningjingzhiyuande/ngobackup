class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_seo_tag
  
  
  def after_sign_in_path_for(resource)
   blogs_path
  end
  def after_sign_out_path_for(resource)
    blogs_path
  end
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "vjoin"
    end
  end

  def set_seo_tag
   @page_title = "NGO网站IT技术支持 ｜ 公益网站IT技术支持"
   @page_keywords = "NGO技术支持,NGO,公益IT支持,公益项目技术支持,NGO IT Backup,公益网站制作"
   @page_description = "以互联网产品的思维方式来运作公益项目,建设公益项目的网络阵地,整合PC和移动互联网,建立无缝宣传和管理.帮助团队和项目更好的协同起来,更有效的开展公益活动"
  end
end
