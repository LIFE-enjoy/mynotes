class UsersController < ApplicationController
  before_action :redirect_show, except: :show

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :encrypted_password, :profile, :avatar)
  end

  def redirect_show
    redirect_to action: :show unless current_user.id == User.find(params[:id]).id
    return
  end
end
