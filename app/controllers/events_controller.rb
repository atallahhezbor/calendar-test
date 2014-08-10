class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(secure_params)
		if @event.valid?
			#TODO send to google
			cal = Google::Calendar.new(:username => 'atallahhezbor@gmail.com',
                           :password => ENV["GMAIL_USERNAME"],
                           :app_name => 'mycompany.com-googlecalendar-integration')

			google_event = cal.create_event do |e|
  				e.title = @event.name
  				e.start_time = @event.timestart
  				e.end_time = @event.timeend
			end

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
