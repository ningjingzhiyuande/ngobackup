class ContactsController < ApplicationController
  def index
  end
  def create
  	post = Post.new(params["contact"])
  	#post.item_type="Message"
  	post.save
  	render :text=>"感谢您的留言，我们将尽快回复您！"
  end
end
