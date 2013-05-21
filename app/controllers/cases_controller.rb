class CasesController < ApplicationController
  def index
  	@cases = Case.page(params[:page]).per(3)
  end
end
