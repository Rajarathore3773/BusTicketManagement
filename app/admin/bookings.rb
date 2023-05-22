#ActiveAdmin.register Booking , as: "Booking" do
ActiveAdmin.register Booking  do
    permit_params :number_of_seats , :fare_ammount , :total_ammount , :starting_point , :destination ,:date_of_booking, :user_id , :bus_id
    #actions :all, :except => [:destroy]
  
    index do
      selectable_column
      id_column
      column :number_of_seats
      column :fare_ammount
      column :total_ammount
      column :starting_point
      column :destination
      column :date_of_booking
      column :user_id
      column :bus_id
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
        f.input :user_id, as: :select, collection: User.pluck(:firstName,:id).uniq
        f.input :bus_id , as: :select, collection: Bus.pluck(:bus_name,:id).uniq
        f.input :number_of_seats
        f.input :fare_ammount
        f.input :total_ammount
        f.input :starting_point
        f.input :destination
        f.input :date_of_booking
      end
      f.actions
    end
  
  end
  