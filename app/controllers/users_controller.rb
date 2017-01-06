class UsersController < ApplicationController
  #предварительный фильтр, вызывает опред метод до опред действий
  before_action :logged_in_user,  only: [:index, :edit, :update, :destroy]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Добро пожаловать!"
      redirect_to @user
    else
      render 'new' #ищет метод new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      #обработать успешное изменение
      flash[:success] = "Профиль обновлен"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Пользователь удален"
    redirect_to users_url
  end

  private
    #возвращает хеш, с разрешенными атрибутами
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #предварительные фильтры
    #подтверждает вход пользователя
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Пожалуйста, авторизуйтесь"
        redirect_to login_url
      end
    end

    #подтверждае права пользователя
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    #подтверждает наличие административных привелегий
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
