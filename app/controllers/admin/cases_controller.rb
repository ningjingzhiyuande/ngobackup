class Admin::CasesController < Admin::BaseController
  #respond_to :html 
 # layout "layer" ,:only=>[:images]
  

  def index
   @cases = Case.all

   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cases.map{|ca| ca.to_jq_upload } }
    end
  end

  def new
    @case = Case.new
    @asset = Asset.new
  end

  def images
    @case =  Case.find params["id"]
    
    respond_to do |format|
       format.html {render :layout => "layer"}
       format.json { render json: @case.assets.map{|ca| ca.to_jq_upload } }
     end
    
  end

  def attach_images
     @case =  Case.find params["id"]
     if params["file"]
       asset = Asset.new({"avatar"=>params["file"]})
       asset.item = @case 
       asset.save
     end

     
     respond_to do |format|
       format.html {
          render :json => [asset.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json { render json: {files: [asset.to_jq_upload]}, status: :created, location: :images_admin_case }
       #format.json { render json: @case.assets.map{|ca| ca.to_jq_upload } }
     end
  end

  def create
  	@case = Case.new(params["case"])
    redirect_to :action=>"index" if @case.save
   # respond_with(:location=>admin_cases_path)
  end

  def edit
  	@case = Case.find params["id"]
  end
  def update
  	@case = Case.find params["id"]
  	redirect_to :action=>"index" if @case.update_attributes(params["case"])


  end
  def destroy
    @case = Case.find params["id"]
  	redirect_to :action=>"index" if @case.destroy
  end
end
