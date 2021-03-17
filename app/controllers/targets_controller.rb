class TargetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :set_target, only: [:show, :edit, :update]
  before_action :target_user, only: [:edit, :update]


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
    if @target.update(target_params)
      redirect_to target_path(@target.id)
    else
      render :edit
    end
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
end
