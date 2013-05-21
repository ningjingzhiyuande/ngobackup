class NgoController < ApplicationController

  def index
  	@ngos = Ngo.page(params[:page]).per(3)
  end
end
