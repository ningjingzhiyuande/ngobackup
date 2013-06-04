class Admin::NgosController < Admin::ApplicationController
  # GET /admin/ngos
  # GET /admin/ngos.json
  def index
    @admin_ngos = Ngo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_ngos }
    end
  end

  # GET /admin/ngos/1
  # GET /admin/ngos/1.json
  def show
    @admin_ngo = Ngo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_ngo }
    end
  end

  # GET /admin/ngos/new
  # GET /admin/ngos/new.json
  def new
    @ngo = Ngo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ngo }
    end
  end

  # GET /admin/ngos/1/edit
  def edit
    @admin_ngo = Admin::Ngo.find(params[:id])
  end

  # POST /admin/ngos
  # POST /admin/ngos.json
  def create
    @admin_ngo = Admin::Ngo.new(params[:admin_ngo])

    respond_to do |format|
      if @admin_ngo.save
        format.html { redirect_to @admin_ngo, notice: 'Ngo was successfully created.' }
        format.json { render json: @admin_ngo, status: :created, location: @admin_ngo }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/ngos/1
  # PUT /admin/ngos/1.json
  def update
    @admin_ngo = Admin::Ngo.find(params[:id])

    respond_to do |format|
      if @admin_ngo.update_attributes(params[:admin_ngo])
        format.html { redirect_to @admin_ngo, notice: 'Ngo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_ngo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/ngos/1
  # DELETE /admin/ngos/1.json
  def destroy
    @admin_ngo = Admin::Ngo.find(params[:id])
    @admin_ngo.destroy

    respond_to do |format|
      format.html { redirect_to admin_ngos_url }
      format.json { head :no_content }
    end
  end
end
