class Admin::HomePicsController <  Admin::BaseController
  def index

  	 @pics = Asset.where("item_type=?","Home")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pics.map{|upload| upload.to_jq_upload } }
    end
  end

  def create
    @asset = Asset.new
    @asset.avatar=params["file"]
    @asset.item_type = "Home"

    respond_to do |format|
      if @asset.save
        format.html {
          render :json => [@asset.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [@asset.to_jq_upload]}, status: :created, location: '/admin/home_pics' }
      else
        format.html { render action: "new" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end

  end
end
