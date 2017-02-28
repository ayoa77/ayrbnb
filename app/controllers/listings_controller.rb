class ListingsController < ApplicationController
    def new
        @listing = Listing.new
        render template: 'listings/new'
    end

    def create
        @listing = current_user.listings.new(listing_params)
        @tags = params[:listing][:tag_ids].reject(&:empty?)
        if @listing.save
            @listing.tag_ids = @tags if @tags
            redirect_to listing_path(@listing)
        else
            render template: 'listings/new'
        end
    end

    def index
        @listings = Listing.all
        render template: 'listings/index'
    end

    def show
        @reservation = Reservation.new
        @listing = Listing.find_by(id: params[:id])
        render template: 'listings/show'
    end

    def edit
    @listing = Listing.find_by(id: params[:id])
    end

    def update
           @listing = Listing.find_by(id: params[:id])
        if @listing.update(listing_params)
            flash[:success] = 'Successfully updated the listing'
            redirect_to @listing
        else
            flash[:danger] = 'Error updating listing'
            render :edit
      end
    end

    def destroy
        @listing = Listing.find_by(id: params[:id])
    end

    private

    def listing_params
        params.require(:listing).permit(:guest, :accomodation, :kind, :title, :description, :address, :city, :country, :price, :bedrooms, :beds, :bathrooms, :start_date, :end_date, {photos: []})
    end
end
