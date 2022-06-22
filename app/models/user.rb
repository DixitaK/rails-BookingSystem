class User < ApplicationRecord
  has_many :events, through: :bookings
  has_many :bookings
  has_and_belongs_to_many :roles
end
