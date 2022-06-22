class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :notifications, as: :notifiable
  enum status: {failed: 0,success:1,progress:2}
end
