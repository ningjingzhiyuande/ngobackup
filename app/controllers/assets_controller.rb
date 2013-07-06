class AssetsController < ApplicationController

	def create
	    asset = Asset.new
        asset.avatar=params["file"]
        asset.item_type = "RichText"
        respond_to do |format|
          if asset.save
            format.html {
              render :json => {"filelink"=> asset.avatar.url},
              :content_type => 'text/html',
              :layout => false
           }
           format.json { render json: {"filelink"=> asset.avatar.url}}
         else
           format.html { render action: "new" }
           format.json { render json: asset.errors, status: :unprocessable_entity }
      end
    end
	end
end
