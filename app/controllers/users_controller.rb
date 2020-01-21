class UsersController < ApplicationController

  def index
    @user=current_user
    @users=User.all
    @book=Book.new
    
  end
  def show
    user=current_user
    @user = User.find(params[:id])
    @book=Book.new
  end
  def edit
    @user = User.find(params[:id])
    if @user.id==current_user.id
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end
  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
      flash[:notice]="successfully 更新できました"
      redirect_to user_path(current_user)
    else
      flash.now[:alert] = 'error 更新失敗です'
      @book=Book.new
      render :show
    end
  end
  private 
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
