class Bus < ApplicationRecord
  #has_many :users
  has_many :bookings

  has_one_attached :image

  enum status: {"available"=>0, "unavailable"=>1}


  # def booked_seats
  #   bookings.sum(:number_of_seats)
  # end
  
  # def available_seats
  #   total_seats - booked_seats
  # end
  def available_seats
    total_seats = self.total_seats || 0
    booked_seats = self.bookings.sum(:number_of_seats) || 0
    total_seats - booked_seats
  end 

end
