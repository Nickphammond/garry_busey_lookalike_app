class UsersController < ApplicationController
    before_action :set_user, only: [:user_profile]
    before_action :authenticate_user!

    def user_profile
    end

    def edit
    end

    private

    def set_user
        @user = current_user
    end

end