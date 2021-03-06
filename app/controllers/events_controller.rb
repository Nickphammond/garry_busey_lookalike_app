class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :set_events
  before_action :set_events_look_a_like, only: [:show]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :show]

  before_action :set_movies, only: [:select_movie, :update, :new]

  require 'uri'
  require 'net/http'
  require 'openssl'
  require 'json'


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

    params[:movies].each do |item1|
      a = nil
      i = 0
      list = Movie.all
      while a == nil && i<(list).length-1
        if item1 == list[i].title
          a = list[i]
        end
        i = i + 1
      end

      if a == nil
        movie = Movie.create(title: item1)
      else
        movie = a
      end

      @event.movies.append(movie)
    end


    respond_to do |format|
      if @event.save
        format.html { redirect_to @event }
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

        format.html { redirect_to @event }
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
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end


  
  def submit_interest
    @event = Event.find(params[:format])

    state = true
    @event.look_a_likes.each do |item|

      if item.user.id == current_user.id
        state = false

      end
    end

    if state == true
      @event.look_a_likes.append(current_user.look_a_like)
    end

  end




  def respond_interest
    @events_look_a_like = EventsLookALike.find(params[:format])


    if @events_look_a_like.host_accepted != true

      @events_look_a_like.host_accepted = true

      @events_look_a_like.save

    else

      @events_look_a_like.look_a_like_accepted = true
      @events_look_a_like.save

    end


    

  end

  
  def user_events

  end



  def select_movie

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def set_events
      @events = Event.all
    end

    def set_events_look_a_like

      @included = false
      @intersection = nil

      @event.events_look_a_likes.each do |item1|
        current_user.look_a_like.events_look_a_likes.each do |item2|
          if item1.id == item2.id
            @included = true
            @intersection = item1
          end
        end
      end

    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:date, :time, :price, :user_id, :listed, look_a_likes: [], movies: [], address_attributes: [:street_number, :street_name, suburb_attributes: [:name, :postcode]])
    end






    def set_movies
      url = URI("https://imdb8.p.rapidapi.com/actors/get-all-filmography?nconst=nm0000997")
  
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = AUTH_DETAILS["IMDB_API_KEY"]
      request["x-rapidapi-host"] = AUTH_DETAILS["IMDB_API_HOST"]
      # request["x-rapidapi-key"] = IMDB_API_KEY
      # request["x-rapidapi-host"] = IMDB_API_HOST
  
      response = http.request(request)
      @movies = JSON.parse(response.read_body)["filmography"]
  
    end

end

