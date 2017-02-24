class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.timestamps
    end
  end
end
