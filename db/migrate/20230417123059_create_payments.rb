class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      
      t.float :booking_amount
      t.datetime :payment_date



      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
