class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @targets = user.targets.order("updated_at DESC")
  end
end
