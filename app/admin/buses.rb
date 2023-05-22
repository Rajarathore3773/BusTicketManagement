ActiveAdmin.register Bus , as: "Bus" do
#ActiveAdmin.register Bus  do
    permit_params :bus_name, :bus_number, :bus_type, :bus_stand, :bus_time , :status, :total_seats, :image
    
    
    index do
      selectable_column
      id_column
      column :bus_name
      column :bus_number
      column :bus_type
      column :bus_stand
      column :bus_time
      column :status
      column :total_seats
      column :available_seats
      column :image do |obj|
        image_tag obj.image,width:100,height:80 if obj.image.attached?
      end

      
    #   column :sign_in_count
    #   column :created_at
      actions
    end
  
    filter :bus_name
    filter :bus_number
    filter :bus_type
    filter :bus_stand
    filter :bus_time
    filter :status
    form do |f|
      f.inputs do
        f.input :bus_name
        f.input :bus_number
        f.input :bus_type
        f.input :bus_stand
        f.input :bus_time
        f.input :status
        f.input :total_seats
        f.input :image,  as: :file#, input_html: { multiple: true }
      end
      f.actions
    end
  

    
  end
  