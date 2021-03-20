class UsersController < ApplicationController
    before_action :set_user, only: [:user_profile, :user_profile_info, :edit_profile_info, :user_profile_lookalike, :edit_profile_lookalike, :update, :update_lookalike]
    before_action :set_events, only: [:user_profile_lookalike, :user_profile_info]
    before_action :set_look_a_like_images, only: [:user_profile_info]
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



    

    private

    def set_user
        @user = current_user
    end



    def set_events
        @events = Event.all
    end


    def set_look_a_like_images
        if @user.look_a_like != nil
        if @user.look_a_like.images != nil
            @images = @user.look_a_like.images
        end
        end
    end


    def user_params
        params.require(:user).permit(:first_name, :last_name, :image, address_attributes: [:street_number, :street_name, suburb_attributes: [:name, :postcode]], look_a_like_attributes: [:bio, :id, images: []])
    end

end