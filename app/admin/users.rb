#ActiveAdmin.register User , as: "Raja" do
    ActiveAdmin.register User  do

    permit_params :firstName, :lastName, :address, :email, :gender, :age, :phone,  :image
    actions :all, :except => [:destroy]
   #actions :index, :destroy ,:show
  index do
    selectable_column
    id_column
      column :firstName
      column :lastName
      column :address
      column :email
      column :gender
      column :age
      column :phone
      #column :bus_id
      column :image do |obj|
        image_tag obj.image,width:100,height:80 if obj.image.attached?
      end
      # column :sign_in_count
      # column :created_at
      actions
    end
  
   
      filter :firstName
      filter :lastName
      filter :address
      filter :email
      filter :gender
      filter :age
      filter :phone
      #filter :bus_id
      
    form do |f|
      f.inputs do
       # f.input :bus_id , as: :select , collection: Bus.pluck(:bus_name, :id)
        f.input :firstName
        f.input :lastName
        f.input :address
        f.input :email
        f.input :gender
        f.input :age
        f.input :phone
        f.input :image,  as: :file#, input_html: { multiple: true }
      end
      f.actions
    end
  
  end
  