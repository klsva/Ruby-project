class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Добро пожаловать!"
      redirect_to @user
    else
      render 'new' #ищет метод new
    end
  end

  private
    #возвращает хеш, с разрешенными атрибутами
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)

    end
end
