class Restaurant < ActiveRecord::Base
	validates :location, :name, :presence => true
end
