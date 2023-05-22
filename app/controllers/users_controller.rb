class UsersController < ApplicationController

    skip_before_action :verify_authenticity_token

    #skip_before_action :verify_authenticity_token, only [:index, :create]
    def index
        users = User.all 

        if users.present?
          render json: {status: "SUCCESS", message: "Fetched all the users successfully", data: users}, status: :ok
        else
         # render json: users.errors, status: :bad_request
         render json: {message:"colud not be found any type of users"}, status: :bad_request
        end
    end

    def show
       user =User.find_by(id: params[:id])
        if user.present?
        render json: {data:user}, status: :ok
        else
        render json: {message: "User could not be found"}, status: :bad_request
        end
    end
    
    # def create
    #  user = User.new(user_params)
    
    #     if user.save
    #     render json: {status: "SUCCESS", message: "User was created successfully!", data: user}, status: :created
    #     else
    #     render json: user.errors, status: :unprocessable_entity
    #     end
    # end
  
  
  
    def update
        user =User.find_by(id: params[:id])
    
        if  user.present? 
            user.update(user_params)
        render json: {message: " user was updated successfully", data: user}, status: :ok
        else
        render json: {message: " user cannot be updated"}, status: :unprocessable_entity
        end
    end


    def destroy
        user = User.find_by(id: params[:id])
    
        if  user.present? 
            user.destroy
        render json: {message: " user was deleted successfully"}, status: :ok
        else
        render json: {message: " user does not exist"}, status: :bad_request
        end
    end

# find bus by user
    def find_bus
        user = User.find_by(id: params[:id])
        if user.present?
            bus = user.bus
            render json: {message: "bus is available for this user", data: bus} , status: :ok
        else
            render json: {message: "bus & user  is not available "}, status: :bad_request
        end
    end

 # find bookings by user
    def find_bookings_user

        user = User.find_by(id: params[:id])
        if user.present?
          bookings = user.bookings
  
         render json: {message: "find bookings successfully by user", data: bookings}, status: :ok
        else
         render json: {message: "This user & bookings  does not exist"}, status: :bad_request
        end
      end
   
      # find payments by user
      def find_payment_user
        user = User.find_by(id: params[:id])
        if user.present?
            payments = user.payments
            render json: {message: "find payments successfully by user", data: payments}, status: :ok
        else
         render json: {message: "This user &  payments  does not exist"}, status: :bad_request
        end
      end

   private
  
   def  user_params
     params.require(:user).permit(:firstName, :lastName, :address, :email, :gender, :age, :phone, :bus_id, :image)
   end


end
