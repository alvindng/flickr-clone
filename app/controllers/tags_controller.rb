class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def show
    @image = Image.find(params[:image_id])
    @tag = Tag.find(params[:id])
  end

  def new
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new
  end

  def create
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new(tag_params)
    @user = User.find_by_id(@tag.user_id)
      if @tag.save
        flash[:success] = "Tag recorded!"
        redirect_to image_path(@image)
      else
        flash[:alert] = "Tag unsuccessful, please try again!"
        render :new
    end
  end

private
  def tag_params
    params.require(:tag).permit(:user_id, :image_id)
  end
end
