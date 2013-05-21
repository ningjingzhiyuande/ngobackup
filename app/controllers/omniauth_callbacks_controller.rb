class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  def weibo
    @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        session[:previous_url] = @user.mobile.blank? ? "/account/oauth_signup" : "/dashboard"
        sign_in_and_redirect @user, :event => :authentication
      else
        #session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end
  
  def tqq
      @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        session[:previous_url] = @user.mobile.blank? ? "/account/oauth_signup" : "/dashboard"
        sign_in_and_redirect @user, :event => :authentication
      else
        #session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end
  
  def qq_connect
      @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        session[:previous_url] = @user.mobile.blank? ? "/account/oauth_signup" : "/dashboard"
        sign_in_and_redirect @user, :event => :authentication
      else
        #session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end

  def renren
  end
  
  
  def tsohu
      @user = User.find_for_oauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        session[:previous_url] = @user.mobile.blank? ? "/account/oauth_signup" : "/dashboard"
        sign_in_and_redirect @user, :event => :authentication
      else
        #session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end

  
  
end