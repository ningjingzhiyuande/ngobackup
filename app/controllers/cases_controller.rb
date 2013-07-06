class CasesController < ApplicationController
  def index
  	@cases = Case.page(params[:page]).per(1)
  end
end
