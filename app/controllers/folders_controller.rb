class FoldersController < ApplicationController
  before_action :set_folder,  only: [:show, :edit, :update, :destroy]
  before_action :set_cabinet, only: [:show, :edit, :update, :destroy, :new]
  before_action :authenticate_user!

  # GET /folders
  # GET /folders.json
  def index
    @folders = current_user.folders
  end

  # GET /folders/1
  # GET /folders/1.json
  def show
  end

  # GET /folders/new
  def new
    @folder = Folder.new
  end

  # GET /folders/1/edit
  def edit
  end

  # POST /folders
  # POST /folders.json
  def create
    @folder = Folder.new(folder_params)
    @cabinet = @folder.cabinet

    if @cabinet.user != current_user
      redirect_to cabinets_path
    end

    respond_to do |format|
      if @folder.save
        format.html { redirect_to @cabinet, notice: 'Folder was successfully created.' }
        format.json { render action: 'show', status: :created, location: @folder }
      else
        format.html { render action: 'new' }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /folders/1
  # PATCH/PUT /folders/1.json
  def update
    respond_to do |format|
      if @folder.update(folder_params)
        format.html { redirect_to @cabinet, notice: 'Folder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @folder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /folders/1
  # DELETE /folders/1.json
  def destroy
    @folder.destroy
    respond_to do |format|
      format.html { redirect_to cabinet_folders_url(@cabinet) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_folder
      @folder = Folder.find(params[:id])
    end

    def set_cabinet
      @cabinet = Cabinet.find(params[:cabinet_id])
      if @cabinet.user != current_user
        redirect_to cabinets_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def folder_params
      params.require(:folder).permit(
        :id,
        :name,
        :description,
        :cabinet_id
      )
    end
end
