class UsersController < ApplicationController
  def show
    @name = current_user.name
    @targets = current_user.targets.order("updated_at DESC")
  end
end
