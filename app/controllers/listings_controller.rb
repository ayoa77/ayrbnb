class ListingsController < ApplicationController
    def new
        @listing = Listing.new
        render template: "listings/new"
    end

    def create
      @listing = current_user.listings.new(listing_params)

      if @listing.save
        sign_in @user
      redirect_to listing_path(@listing)
      else
        render template: "listings/new"
      end
    end

    def index
        @listings = Listing.all
        render template: "listings/index"
    end

    def show
        @listing = Listing.find_by(id: params[:id])
        render template: "listings/show"
    end

    def edit
        @listing = Listing.find_by(id: params[:id])
    end

    def destroy
        @listing = Listing.find_by(id: params[:id])
    end

    private

    def listing_params
      params[:listing].permit(:accomodation, :kind, :title, :description, :address, :city, :country, :price, :bedrooms, :beds, :bathrooms)
    end
end
