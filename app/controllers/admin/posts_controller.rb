class Admin::PostsController < Admin::BaseController
  def index
  	@posts =  Post.page(params[:page]).per(10)
  end
  def destroy
  	post = Post.find params[:id]
  	post.destroy
  	redirect_to :back
  end
end
