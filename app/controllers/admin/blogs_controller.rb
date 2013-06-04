class Admin::BlogsController < Admin::ApplicationController
  def index
  	@blogs = Blog.order("id desc")
  end
end
