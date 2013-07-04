class BlogsController < ApplicationController
  before_filter :authenticate_user! ,:only=>[:new,:riche_text]

  def index
  	@blogs = Blog.order("id desc").page(params[:page]).per(3)
  	
  end

  def rich_text
     @blog = Blog.new
  end

  def show
    @blog = Blog.find params[:id]
    @flag=true
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
