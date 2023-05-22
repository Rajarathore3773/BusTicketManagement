class AddTotalSeatsToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :total_seats, :integer
  end
end
