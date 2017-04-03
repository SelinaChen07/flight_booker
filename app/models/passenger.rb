class Passenger < ApplicationRecord
	belongs_to :booking, inverse_of: :passengers

	before_save{self.email.downcase!}

	validates :name, presence:true, length: {maximum: 255}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}
end
