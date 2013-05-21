class BlogsController < ApplicationController
  before_filter :authenticate ,:only=>[:new]

  def index
  	@blogs = Blog.order("id desc").page(params[:page]).per(3)
  	
  end

  def show
  end

  def new 
     @blog = Blog.new
  end
  def create
  	redirect_to :action =>"index"
  end
end
