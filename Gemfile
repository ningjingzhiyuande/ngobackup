source 'http://ruby.taobao.org'
#source 'https://rubygems.org'

gem 'rails', '3.2.12'
gem 'mysql2'
group 'assets' do
  gem 'sass-rails',   '~> 3.2.3'
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'coffee-rails', '~> 3.2.1'
 
  gem 'quiet_assets', :git => 'git://github.com/AgilionApps/quiet_assets.git' 
end

gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
#gem 'jquery-fileupload-rails'
# Gems used only for assets and not required
# in production environments by default.


gem 'simple_enum'
gem 'therubyracer', :platforms => :ruby
gem 'uglifier', '>= 1.0.3'
gem 'jquery-rails'
gem 'rails_kindeditor'
gem 'acts-as-taggable-on', '~> 2.3.1'
# 文件和图片处理
gem 'carrierwave'
gem 'mini_magick'
gem 'piet'
gem 'devise'
# Omniauth
gem 'omniauth'
gem 'omniauth-oauth'
gem 'omniauth-oauth2'
gem 'omniauth-qq'
gem 'omniauth-renren-oauth2'
gem 'omniauth-weibo-oauth2'
gem 'kaminari'

#gem 'macaddr'


group :development do
  gem 'pry'
  gem 'pry-nav'
end


# Use unicorn as the app server
group :production do
  gem 'unicorn'
  gem 'bluepill','0.0.63'
  gem 'capistrano'
end

