class HomeController < ApplicationController
  def index
  	@pics = Asset.where("item_type=?","Home").limit(5)
  	@cases = Case.where("min_image is not null").limit(6)
  	@blogs = Blog.order("is_top desc").limit(3)
  end
end
