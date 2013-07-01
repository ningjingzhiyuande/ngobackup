class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_filter :omniauth_auth
  respond_to :html, :xml, :json
  def weibo
  
  end
  
  def tqq
  
  end
  
  def qq_connect
      
  end

  def renren
   
  end
  
  
  def tsohu
      
  end

  private 
  def  omniauth_auth
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
    sign_in @user, :event => :authentication 
    redirect_to after_sign_in_path_for(@user)
  end


  
end