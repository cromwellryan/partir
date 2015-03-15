class DeploysController < ApplicationController
  before_action :set_deploy, only: [:show, :destroy]

  # GET /projects/:project_id/deploys
  # GET /projects/:project_id/deploys.json
  def index
    @project = Project.find params[:project_id]
    @deploys = @project.deploys
  end

  # GET /projects/:project_id/deploys/1
  # GET /projects/:project_id/deploys/1.json
  def show
    @project = @deploy.project
  end

  # POST /projects/:project_id/deploys
  # POST /projects/:project_id/deploys.json
  def create
    @project = Project.find params[:project_id]
    @deploy = @project.record_deploy deploy_params

    respond_to do |format|
      if @deploy.save
        format.html { redirect_to [@project, @deploy], notice: 'deploy was successfully created.' }
        format.json { render :show, status: :created, location: [@project, @deploy] }
      else
        format.html { render status: :bad_request, text: @deploy.errors }
        format.json { render json: @deploy.errors, status: :unprocessable_entity }
      end
    end

    Rails.logger.debug @deploy.errors.full_messages
  end

  # PATCH/PUT /deploys/1
  # PATCH/PUT /deploys/1.json
  def update
    respond_to do |format|
      if @deploy.update(deploy_params)
        format.html { redirect_to @deploy, notice: 'deploy was successfully updated.' }
        format.json { render :show, status: :ok, location: @deploy }
      else
        format.html { render :edit }
        format.json { render json: @deploy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deploys/1
  # DELETE /deploys/1.json
  def destroy
    @deploy.destroy
    respond_to do |format|
      format.html { redirect_to deploys_url, notice: 'deploy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deploy
      @deploy = Deploy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deploy_params
      params.require(:deploy).permit(:sha, :environment)
    end
    def json_request?
      request.format.json?
    end
end
