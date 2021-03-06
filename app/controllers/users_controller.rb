class UsersController < ApplicationController
    before_action :set_user
    before_action :set_events, only: [:user_profile_lookalike, :user_look_a_like, :user_look_a_like_events]
    before_action :set_look_a_like, only: [:user_look_a_like, :remove_suburb]
    before_action :set_look_a_like_images, only: [:user_look_a_like, :look_a_like_form, :remove_suburb]
    before_action :authenticate_user!

    def user_profile
    end




    def user_look_a_like
    end

    def user_look_a_like_events
    end

    def edit_profile_info
        render "info_form"
    end




    def user_profile_lookalike

    end



    def edit_profile_lookalike
    end

    def look_a_like_form
    end



    
    def update
        

        if @user.update(user_params)
            redirect_to "/profile"
        else
         render "/edit_profile_info", error: "Please try again"
        end
    end


    def remove_suburb

        current_user.look_a_like.suburbs.delete(Suburb.find(params[:format]))

        render "user_look_a_like"
        


    end



    

    private

    def set_user
        @user = current_user
    end


    def set_events
        @events = Event.all
    end


    def set_look_a_like
        @look_a_like = @user.look_a_like
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