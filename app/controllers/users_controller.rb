class UsersController < ApplicationController
    before_action :set_user, only: [:user_profile, :user_profile_info, :edit_profile_info, :user_profile_lookalike, :edit_profile_lookalike, :update, :update_lookalike]
    before_action :set_events, only: [:user_profile_lookalike]
    before_action :authenticate_user!

    def user_profile
    end




    def user_profile_info
    end

    def edit_profile_info
    end




    def user_profile_lookalike
    end

    def edit_profile_lookalike
    end




    def update
        if @user.update(user_params)
            redirect_to "/profile/info"
        else
         render "/edit_profile_info", error: "Please try again"
        end
    end


    def update_lookalike
        
    end

    

    private

    def set_user
        @user = current_user
    end

    def set_events
        @events = Event.all
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, address_attributes: [:street_number, :street_name, suburb_attributes: [:name, :postcode]], look_a_like_attributes: [:bio])
    end

    # def lookalike_params
    #     params.require(:look_a_like).permit(:first_name, :last_name, address_attributes: [:street_number, :street_name, suburb_attributes: [:name, :postcode]], look_a_like_attributes: [])
    # end

end