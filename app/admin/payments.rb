ActiveAdmin.register Payment , as: "Payment" do
#ActiveAdmin.register Payment  do
    permit_params :booking_amount,:payment_date ,:user_id, :booking_id
    #actions :all, :except => [:destroy]
  
    index do
      selectable_column
      id_column
      column :booking_amount
      column :payment_date
      column :user_id
      column :booking_id
    #   column :sign_in_count
    #   column :created_at
      actions
    end
  
    # filter :firstName
    # filter :lastName
    # # filter :sign_in_count
    # # filter :created_at
  
    form do |f|
      f.inputs do
        f.input :user_id, as: :select , collection: User.pluck(:firstName, :id)
        f.input :booking_id , as: :select , collection: Booking.pluck(:id)
        f.input :booking_amount
        f.input :payment_date
        
      end
      f.actions
    end
  
  end
  