class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #осуществить вход пользователя и переадресовать на страницу профиля
      log_in user
      redirect_to user
    else
      #создать сообщение об ошибке
      flash.now[:danger] = 'Неверно введен логин или пароль!'
      render 'new'
    end

  end

  def destroy

  end
end
