class AddListingToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :listing_id, :integer, index: true
  end
end
