class BusesController < ApplicationController
    skip_before_action :verify_authenticity_token


    def index
     buses = Bus.all 

        if buses.present?
          render json: {status: "SUCCESS", message: "Fetched all the buses successfully", data: buses}, status: :ok
        else
          render json:  {message:"colud not be found any type of bues"} , status: :bad_request
        end
    end

    def show
        bus = Bus.find_by(id: params[:id])
        if bus.present?
        render json: {data:bus}, status: :ok
        else
        render json: {message: "Bus could not be found"}, status: :bad_request
        end
    end
    
    # def create
    #     bus = Bus.new(bus_params)
    
    #     if bus.save
    #     render json: {status: "SUCCESS", message: "bus was created successfully!", data: bus}, status: :created
    #     else
    #     render json: bus.errors, status: :unprocessable_entity
    #     end
    # end
  
  
  
    def update
        bus = Bus.find_by(id: params[:id])
    
        if bus.present? 
            bus.update(bus_params)
        render json: {message: "Bus was updated successfully", data:bus}, status: :ok
        else
        render json: {message: "Bus cannot be updated"}, status: :unprocessable_entity
        end
    end



    def destroy
        bus = Bus.find_by(id: params[:id])
    
        if bus.present? 
           bus.destroy!
        render json: {message: "Bus was deleted successfully"}, status: :ok
        else
        render json: {message: "Bus does not exist"}, status: :bad_request
        end
    end
   
     def find_user

       bus = Bus.find_by(id: params[:id])
      if bus.present?
         user = bus.users
        render json: {message: "find user successfully by bus", data: user}, status: :ok
       else
        render json: {message: "This Bus & user  does not exist"}, status: :bad_request
       end
     end

     def find_bookings

      bus = Bus.find_by(id: params[:id])
     if bus.present?
        bookings = bus.bookings

       render json: {message: "find bookings successfully by bus", data: bookings}, status: :ok
      else
       render json: {message: "This Bus & bookings  does not exist"}, status: :bad_request
      end
    end


    
   private
  
   def bus_params
     params.require(:bus).permit(:bus_name, :bus_number, :bus_type, :bus_stand, :bus_time,:status,:total_seats, :image)
   end



   
end
