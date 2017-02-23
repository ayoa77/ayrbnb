class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :accomodation #apartment or house
      t.string :type #entire place, private room, or shared room
      t.string :title
      t.string :description
      t.string :address
      t.string :city
      t.string :country
      t.integer :guest
      t.integer :price
      t.integer :bedrooms
      t.integer :beds
      t.float   :bathrooms
      t.references :users, index: true
    end
  end
end
