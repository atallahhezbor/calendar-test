class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(secure_params)
		if @event.valid?
			#TODO send to google
			#TODO send message
			flash[:notice] = "Event #{@event.name} was created."
			redirect_to root_path
		else
			render :new
		end
	end

	private

	def secure_params 
		params.require(:event).permit(:name ,:date, :timestart, :timeend)
	end

end
