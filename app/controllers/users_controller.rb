class UsersController < ApplicationController
  def show
    @user = current_user
    @users = User.all
  end
end
