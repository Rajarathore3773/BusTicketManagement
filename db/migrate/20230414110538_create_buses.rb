class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.string :bus_name
      t.string :bus_number
      t.string :bus_type
      t.string :bus_stand
      t.datetime :bus_time

      t.timestamps
    end
  end
end
