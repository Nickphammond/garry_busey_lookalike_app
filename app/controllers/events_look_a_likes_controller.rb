class EventsLookALikesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_events_look_a_like

    def show
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

    private

    def set_events_look_a_like
        @events_look_a_like = EventsLookALike.find(params[:id])
    end

end