class TargetsController < ApplicationController
  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      redirect_to 'users/show'
    else
      render :new
    end
  end

  private
  def target_params
    params.require(:target).permit(:title, :genre_id, :deadline, :plan, :great_man, :future, :image).merge(user_id: current_user.id)
  end
end
