class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


    # belongs_to :bus
    has_many :bookings
    has_many :payments

    has_one_attached :image

    validate :Check_first_name

    def Check_first_name
      firstName = User.where("firstName = ?",firstName)
      errors.add(:firstName,firstName)
    end


end
