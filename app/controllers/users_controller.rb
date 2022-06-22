class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.roles << Role.find_by(id:params[:user][:role_ids])
      if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end  
  end

  private
    def user_params
      params.require(:user).permit(:name, :phone, :email,:role_id)
    end
end
