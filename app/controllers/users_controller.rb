class UsersController < ApplicationController
  def index
    if logged_in?
      @tasks = current_user.tasks.all.page(params[:page])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました'
      redirect_to login_url
    else
      flash[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
