class Visitor < ActiveRecord::Base
	has_no_table
	column :email, :string
	validates_presence_of :email
	validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	#def add event