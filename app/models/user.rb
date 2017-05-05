class User < ApplicationRecord
  validates :name,presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password ,presence: true,
	             length:{minimum: 5}
end
