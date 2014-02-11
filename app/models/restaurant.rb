class Restaurant < ActiveRecord::Base
	validates :location, :name, :presence => true
	has_many :reservations
	has_many :users, :through => :reservations
end
