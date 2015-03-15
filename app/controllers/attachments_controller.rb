class AttachmentsController < ApplicationController
  before_action :set_project, only: [:index, :show, :create, :destroy]
  before_action :set_deploy, only: [:index, :show, :create, :destroy]

  def index
    @attachments = @deploy.attachments
  end

  def show
    @attachment = Attachment.find params[:id]
  end

  def create
    Rails.logger.debug attachment_params
    @attachment = @deploy.add_attachment attachment_params

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to [@project, @deploy, @attachment], notice: 'attachment was successfully created.' }
        format.json { render :show, status: :created, location: [@project, @deploy, @attachment] }
      else
        format.html { render status: :bad_request, text: @attachment.errors }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    def attachment_params
      params.require(:attachment).permit!
    end
    def set_project
      @project = Project.find(params[:project_id])
    end
    def set_deploy
      @deploy = Deploy.find(params[:deploy_id])
    end
end
