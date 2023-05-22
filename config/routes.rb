Rails.application.routes.draw do
   root "home#index"
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # devise_for :users,controllers: {
  # #  sessions: 'users/sessions',
  #   registrations: 'users/registrations'
  # }  

# #  custom routes for bus
get '/buses', to:'buses#index'
get '/buses/:id', to:'buses#show'

post '/buses', to:'buses#create'

put '/buses/:id', to:'buses#update'
delete '/buses/:id', to:'buses#destroy'
# #find by user and booking by => "Bus" #
# # get "/buses/:id/users" , to: 'buses#find_user'
# # get "/buses/:id/bookings" , to: 'buses#find_bookings'


# #  custom routes for users

# # get '/users', to:'users#index'
# # get '/users/:id', to:'users#show'

# # post '/users', to:'users#create'

# # put '/users/:id', to:'users#update'
# # delete '/users/:id', to:'users#destroy'

# # find bus, booking and payments by => "User"#
# # get "/users/:id/bus" , to:'users#find_bus'
# # get "/users/:id/bookings", to:'users#find_bookings_user'
# # get "/users/:id/payments", to:'users#find_payment_user'


# #  custom routes for bookings
# get '/bookings', to:'bookings#index'
# get "/bookings/:id", to:'bookings#show'
# post '/bookings' , to: 'bookings#create'
# put '/bookings/:id', to:'bookings#update'
# delete "/bookings/:id" , to:'bookings#destroy'

# #find bus ,user and payments by => "Booking" #
# # get "/bookings/:id/bus" , to: 'bookings#find_bus_by_booking'
# # get "/bookings/:id/user", to: 'bookings#find_user_by_booking'
# # get "/bookings/:id/payments", to: 'bookings#find_payment_by_booking'


# #custom routes for paymentss
# get '/payments' , to: 'payments#index'
# get '/payments/:id' , to: 'payments#show'

# post '/payments' , to: 'payments#create'
# put '/payments/:id' , to: 'payments#update'
# delete '/payments/:id' , to: 'payments#destroy'

# find user and booking by => "Payment" #
# get "/payments/:id/user", to: 'payments#find_user_by_payment'
# get "/payments/:id/booking", to: 'payments#find_booking_by_payment'



end

