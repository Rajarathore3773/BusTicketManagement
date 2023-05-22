class BookingsController < ApplicationController
    skip_before_action :verify_authenticity_token


  def index
        bookings = Booking.all
        
        if bookings.present?
            render json:{status: "success", message: "Fetched all the bookinges successfully", data: bookings }, status: :ok
        else
            render json: {message:"colud not be found any type of bookings"}  , status: :bad_request
        end
  end


   def show
       booking = Booking.find_by(id: params[:id])
        if booking.present?
            render json: {data:booking} , status: :ok
        else
            render json: {message: "booking could not be found"}, status: :bad_request
        end

   end

   def create
   booking =Booking.new(booking_params)

    if booking.save
    render json: {status: "SUCCESS", message: "booking was created successfully!", data:booking}, status: :created
    else
    render json:booking.errors, status: :unprocessable_entity
    end
  end

   def update
    booking = Booking.find_by(id: params[:id])
        if booking.present?
            booking.update(booking_params)
           render json: {message: "Booking was updated successfully", data:booking}, status: :ok
        else
        render json: {message: "Booking cannot be updated"}, status: :unprocessable_entity
        end
   end

   def destroy
    booking = Booking.find_by(id: params[:id])
    if booking.present?
       booking.destroy!
    render json: {message: "Booking was deleted successfully"}, status: :ok
    else
    render json: {message: "Booking does not exist"}, status: :bad_request
    end
end

def find_bus_by_booking
    booking = Booking.find_by(id: params[:id])

    if booking.present?
        bus = booking.bus
        render json: { message: "Bus is available for this booking", data: bus}, status: :ok
    else
        render json: { message: "Bus is not available for this booking"}, status: :not_found
    end
end

def find_user_by_booking
    booking = Booking.find_by(id: params[:id])
    if booking.present? 
        user = booking.user
        render json: { message: "user is available for this booking", data:user}, status: :ok
    else
        render json: { message: "user  is not available for this booking"}, status: :not_found
    end   
end

def find_payment_by_booking
    booking = Booking.find_by(id: params[:id])
    if booking.present? 
        payments = booking.payments
        render json: { message: "payment is available for this booking", data: payments}, status: :ok
    else
        render json: { message: "payment  is not available for this booking"}, status: :not_found
    end     

end



private
def booking_params
    params.require(:booking).permit(:number_of_seats , :fare_ammount , :total_ammount , :starting_point , :destination ,:date_of_booking, :user_id , :bus_id)
end



end
