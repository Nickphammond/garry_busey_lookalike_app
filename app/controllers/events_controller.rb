class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :set_events
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :show]


  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.user_id = current_user.id
    @event.build_address
    @event.build_address.build_suburb

  end



  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update

    respond_to do |format|
      if @event.update(event_params)

        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  
  def submit_interest
    @event = Event.find(params[:format])
    @event.look_a_likes.append(current_user.look_a_like)


  end

  
  def user_events

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_events
      @events = Event.all
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:date, :time, :price, :user_id, :listed, look_a_likes: [], address_attributes: [:street_number, :street_name, suburb_attributes: [:name, :postcode]])
    end

end
