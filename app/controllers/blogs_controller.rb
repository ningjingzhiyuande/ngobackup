class BlogsController < ApplicationController
  before_filter :authenticate_user! ,:except=>[:index,:show]

  def index
  	@blogs = Blog.order("id desc").page(params[:page]).per(3)
  	
  end

  def rich_text
     @rich = RichText.new()
  end

  def create_rich
    rich = RichText.new(:content=>params["rich"])
    rich.user_id = current_user.id
    rich.status=params["status"].to_i
    return render :json=>{"content"=>"内容为空!"}  if params["content"].blank?
    render :json=>{"content"=>"提交成功!"} if  rich.save
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
    blog.user_id=current_user.id
    if blog.save
  	  redirect_to :action =>"index"
    else
      render action: :new
    end
  end
end
