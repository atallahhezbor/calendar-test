class Event < ActiveRecord::Base

	has_no_table
	column :name, :string
	column :date, :string
	column :timestart, :string
	column :timeend, :string
	validates_presence_of :name
	validates_presence_of :date
	validates_presence_of :timestart
	validates_presence_of :timeend
	
end
