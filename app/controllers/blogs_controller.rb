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
    blog = Blog.new(params["blog"])
    if blog.save
  	  redirect_to :action =>"index"
    else
      render action: :new
    end
  end
end
