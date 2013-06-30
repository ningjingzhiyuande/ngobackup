class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:name, :provider, :uid, :access_token, :access_token_secret, :nickname, :avatar
  # attr_accessible :title, :body
  
  def self.find_for_oauth(access_token, signed_in_resource=nil)
    credentials = access_token.credentials
    info = access_token.info
    full_info = access_token.extra.raw_info
    user = User.where(provider: access_token.provider,uid: access_token.uid).first
    unless user
      password = Devise.friendly_token[0,8]
      user = User.new(
        name: info["name"],
        email: info["email"],
        provider: access_token.provider,
        uid: access_token.uid,
        access_token: credentials.token,
        access_token_secret: credentials.secret,
        password: password,
        password_confirmation: password,
        nickname: info["nickname"],
        avatar: info["image"]
        #remote_logo_url: info.image,
      )
      user.save!
    end
    user
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end


end
