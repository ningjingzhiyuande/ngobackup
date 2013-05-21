class Admin::BlogsController < Admin::BaseController
  def index
  	@blogs = Blog.order("id desc")
  end
end
