class AddStatusToBuses < ActiveRecord::Migration[7.0]
  def change
    add_column :buses, :status, :integer
  end
end
