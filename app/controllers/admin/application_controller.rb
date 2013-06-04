class Admin::ApplicationController < ApplicationController
	layout 'backoffice'
	before_filter :authenticate 

  
end