class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
       t.integer :number_of_seats
       t.float :fare_ammount
       t.float :total_ammount
       t.string :starting_point
       t.string :destination
       t.datetime :date_of_booking




      t.references :user, null: false, foreign_key: true
      t.references :bus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
