class ImagesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @user = User.find(params[:user_id])
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @user = current_user
    @image = @user.images.new
    if @user.id != current_user.id
      redirect_to user_path(@user)
    end
  end

  def create
    @user = current_user
    @image = @user.images.new(image_params)
      if @image.save
        flash[:success] = "Image uploaded!"
        redirect_to user_path(@user)
      else
        flash[:alert] = "Upload unsuccessful, please try again!"
        render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.user_id === current_user.id
      @image.destroy
      flash[:error] = "Image deleted!"
    end
    redirect_to user_path(@image.user)
  end

private
  def image_params
    params.require(:image).permit(:img_file)
  end
end
