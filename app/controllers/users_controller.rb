# app/controllers/users_controller.rb

class UsersController < ApplicationController

    def new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to '/'
      else
        render 'sessions/new'
      end
    end

private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end