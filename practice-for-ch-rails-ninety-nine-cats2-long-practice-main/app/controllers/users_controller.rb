class UsersController < ApplicationController
    def new 
        @user = User.new 
        render :new 
    end

    def create 
        @user = User.new(params.require(:user).permit(:username, :password))
        if @user.save 
            login!(@user)
        else
            render :new 
        end
    end
end