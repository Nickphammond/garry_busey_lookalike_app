class SuburbsController < ApplicationController
    before_action :set_suburbs, only: %i[ show edit update destroy ]
    before_action :set_user

    

    def index

    end

    def new
        @suburb = Suburb.new
    end

    def create
        @suburb = Suburb.new(suburb_params)
        @suburb.look_a_likes.append(@user.look_a_like)
    
        respond_to do |format|
            if @suburb.save
            format.html { redirect_to @suburb, notice: "Event was successfully created." }
            format.json { render :show, status: :created, location: @suburb }
            else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @suburb.errors, status: :unprocessable_entity }
            end
        end
    end

    # def show

    # end

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