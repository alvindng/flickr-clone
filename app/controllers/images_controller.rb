class ImagesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @image = @user.images.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = @user.images.new(image_params)
    if @image.save
      flash[:success] = "Image uploaded!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Upload unsuccessful, please try again!"
      render :new
    end
  end

private
  def image_params
    params.require(:image).permit(:img_file)
  end
end
