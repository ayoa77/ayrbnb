class ReservationsController < ApplicationController
    def new
        @reservation = Reservation.new
        render :new
    end

    def create
        @reservation = current_user.reservations.new(reservation_params)
        byebug
        # @resvervation.overlap(:check_in, :check_out, current_listing.reservations.check_in, current_listing.reservations.check_out)
        if @reservation.save
            redirect_to @reservation.listing      #listings_reservation_path(params[:listing_id])
        else
            render :new
        end
    end

    def index
        @reservation = Reservation.where(listing_id: params[:listing_id])
    end

    private

    def reservation_params
        params.require(:reservation).permit(:check_in, :check_out, :listing_id)
    end
end
