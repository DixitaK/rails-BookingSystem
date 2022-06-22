class Event < ApplicationRecord
  belongs_to :category
  belongs_to :location
  has_many :bookings
  has_many :users, through: :bookings
  has_many :notifications, as: :notifiable , dependent: :delete_all

  after_create :create_notification

  private
  def create_notification
    self.notifications.create(message:"#{self.name} Event Update")
  end
end
