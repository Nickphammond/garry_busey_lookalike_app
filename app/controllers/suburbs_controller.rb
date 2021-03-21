class SuburbsController < ApplicationController
    before_action :set_suburbs, only: %i[ show edit update destroy ]
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :event_params

    def edit

    end

    def update
        
    end


    private

    def set_suburbs
        @suburbs = Suburb.all
    end

    def set_user
        @user = current_user
    end

    def suburb_params
        params.require(:suburb).permit(:name, :postcode)
    end

end