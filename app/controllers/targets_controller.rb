class TargetsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_target, only: [:show, :edit, :update]
  before_action :target_user, only: [:edit, :update]

  def index
    @targets = Target.order("created_at DESC")
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    # if params[:target][:image_id]
    #   image = @target.image.find(image_id)
    #   image.purge
    # end
    if @target.update(target_params)
      redirect_to target_path(@target.id)
    else
      render :edit
    end
  end

  def destroy
    target = Target.find(params[:id])
    target.destroy if current_user.id == target.user_id
    redirect_to root_path
  end


  private
  def target_params
    params.require(:target).permit(:title, :genre_id, :deadline, :plan, :great_man, :future, :image).merge(user_id: current_user.id)
  end

  def set_target
    @target = Target.find(params[:id])
  end

  def target_user
    if current_user.id != @target.user_id
      redirect_to root_path
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
