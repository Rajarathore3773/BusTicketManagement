class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index 
    payments = Payment.all
    if payments.present?
        render json: {status:"success", message:"Fatched all payments successfully", data: payments}, status: :ok
        else
            render json: {message:"colud not be found any type of payments"} , status: :bad_request
        end
    end



    def show
        payment  = Payment.find_by(id: params[:id])
        if payment.present? 
            render json: {data: payment}, status: :ok
        else
            render json: {message: "Payment could not be found"}, status: :bad_request
        end
    end


    def create
        payment = Payment.new(payment_params)
        if payment.save
            render json: {status:"success", message:"Payment was successfully created", data: payment}, status: :created
        else
            render json: payment.errors, status: :unprocessable_entity
        end
    end

    def update
        payment  = Payment.find_by(id: params[:id])
            if payment.present? 
                payment.update(payment_params)
                render json: {message:"payment was successfully updated", data: payment}, status: :ok
            else
                render json: {message:"payment could not be updated"}, status: :unprocessable_entity
            end
    end


    def destroy
        payment  = Payment.find_by(id: params[:id])
        if payment.present? 
            payment.destroy
            render json: {message:"payment was successfully destroyed"}, status: :ok
        else
            render json: {message:"payment does not exist for  destroy"}, status: :bad_request
        end
    end

     def find_user_by_payment
        payment = Payment.find_by(id: params[:id])
        if payment.present?
            user = payment.user
        render json: {message:"user is available for this payment", data: user}, status: :ok
        else
            render json: {message:"user is not available for this payment"}, status: :not_found
        end
     end

     def find_booking_by_payment
        payment = Payment.find_by(id: params[:id])
        if payment.present?
            booking = payment.booking
            render json: {message:"booking is available for this payment", data: booking}, status: :ok
        else
            render json: {message:"booking is not available for this payment"}, status: :not_found
        end  

     end

    
    private
    def payment_params
        params.require(:payment).permit(:booking_amount,:payment_date ,:user_id, :booking_id )
    end







    
end
