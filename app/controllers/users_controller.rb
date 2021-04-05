class UsersController < ApplicationController
  before_action :set_current_user, except: %i[new create]

  def show
    render layout: 'empty'
  end

  def add_image; end

  def upload_image
    if @user.images.attach(image_params[:images])
      flash[:notice] = "image uploaded"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = "image upload failed"
      render :add_image
    end
  end

  def all_images
    render layout: 'empty'
  end

  def delete_image
    @image =  ActiveStorage::Blob.find_signed(img_params[:id])
    @image.attachments.first.purge
    flash[:notice] = "image deleted"
    redirect_to all_images_path(@user.id)
  end

  private

  def image_params
    params.require(:add_user_img).permit(:images)
  end

  def img_params
    params.permit(:id)
  end
end

#bootstrap/dist/css/bootstrap