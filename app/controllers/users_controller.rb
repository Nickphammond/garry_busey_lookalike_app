class UsersController < ApplicationController
    before_action :set_user, only: [:user_profile, :edit, :update]
    before_action :authenticate_user!

    def user_profile
    end

    def edit
    end

    def update
        if @user.update(user_params)
            redirect_to "/profile"
        else
         render "edit", error: "Please try again"
        end
    end

    

    private

    def set_user
        @user = current_user
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :address)
    end

end