class Job < ApplicationRecord
  belongs_to :user

  has_many :applications
  has_many :users, through: :applications
end
