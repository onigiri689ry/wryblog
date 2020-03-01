class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:page]).per(3).order("created_at DESC")
  end
end
