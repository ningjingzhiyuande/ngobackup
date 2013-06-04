class Admin::AssetsController < Admin::ApplicationController
  
  def destroy
  	@asset=Asset.find params[:id]
  	@asset.destroy
  	respond_to do |format|
      format.json { render json: {"status"=>"ok"}} if @asset.destroy
    end
  end
end
