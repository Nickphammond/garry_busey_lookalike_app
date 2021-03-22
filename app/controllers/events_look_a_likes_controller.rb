class EventsLookALikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_events_look_a_like, only: [:edit, :update, :destroy]
    before_action :set_event


    def new
        @events_look_a_like = EventsLookALike.new
    end

    def show
        if @events_look_a_like.event.price != nil
            @events_look_a_like.price = @events_look_a_like.event.price
        end
        session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: @events_look_a_like.event.user.email,
        line_items: [{
            name: @events_look_a_like.look_a_like.user.first_name + ' ' + @events_look_a_like.look_a_like.user.last_name,
            description: @events_look_a_like.event.time.to_s + ' ' + @events_look_a_like.event.date.to_s ,
            amount: @events_look_a_like.price,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @events_look_a_like.id
            }
        },
        success_url: "#{root_url}payments/success?events_look_a_likeId=#{@events_look_a_like.id}&eventId=#{@events_look_a_like.event.id}",
        cancel_url: "#{root_url}events_look_a_likes"
    )

    @session_id = session.id

    end


    def create
        @event = Event.find(params[:events_look_a_like][:event_attributes][:id])
        @events_look_a_like = EventsLookALike.new(event_id: params)
        @events_look_a_like.look_a_like = current_user.look_a_like
        @events_look_a_like.event = @event

    
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





    def update


    end


    

    private

    def set_events_look_a_like
        @events_look_a_like = EventsLookALike.new(event_id: params)
        @event = Event.find(params[:events_look_a_like][:event_attributes][:id])
        @events_look_a_like.event = @event
        @events_look_a_like.look_a_like = current_user.look_a_like
    end

    def set_event
  
    end

    def event_params
        params.require(:events_look_a_like).permit(:event)
    end

end