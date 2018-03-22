class AttachmentsController < ApplicationController
  before_action :require_login, except: [:not_authenticated]


  def index
    @attachments = current_user.attachments
  end

  def show
    @attachment = current_user.attachments.find(params[:id])
  end

  def new
    @attachment = current_user.attachments.new
  end

  def create
    @attachment = current_user.attachments.new(attachment_params)
    if @attachment.save
      flash[:notice]= "成功上传文件！"
      redirect_to  attachments_path
    else
      render :action => 'new'
    end
  end

  def picture
    attachment = current_user.attachments.find_by_id(params[:id])
    if attachment
      send_file attachment.uploaded_file.path, :type => attachment.uploaded_file_content_type
    end
  end

  def edit
    @attachment = current_user.attachments.find(params[:id])

  end

  def update
    @attachment = current_user.attachments.find(params[:id])
  end

  def destroy
    @attachment = current_user.attachments.find(params[:id])
  end



  private
  def attachment_params
    params.require(:attachment).permit(:uploaded_file,:user_id)
  end

  def not_authenticated
    redirect_to root_path, alert: '请先登录.'
  end

end