class UsersController < ApplicationController
  def show
    @name = current_user.name
    @targets = current_user.targets.order("created_at DESC")
  end
end
