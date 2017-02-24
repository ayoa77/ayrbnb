class ListingsController < ApplicationController
    def new
        @listing = Listing.new
        render template: "listings/new"
    end

    def create
      @listing = current_user.listings.new(listing_params)
      @tags = params[:listing][:tags_ids].reject(&:empty?)
      if @listing.save
      @listing.tag_ids = @tags if @tags
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
      params[:listing].permit(:guest, :accomodation, :kind, :title, :description, :address, :city, :country, :price, :bedrooms, :beds, :bathrooms, :start_date, :end_date)
    end
end
