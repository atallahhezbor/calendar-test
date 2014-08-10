class VisitorsController < ApplicationController

	def new
		@visitor = Visitor.new
	end

	def create
		@auth = request.env["omniauth.auth"]
    	#Use the token from the data to request a list of calendars
    	@token = @auth["credentials"]["token"]
    	client = Google::APIClient.new
		client.authorization.access_token = @token
    	service = client.discovered_api('calendar', 'v3')
    	@result = client.execute(
      	:api_method => service.calendar_list.list,
      	:parameters => {},
      	:headers => {'Content-Type' => 'application/json'})
  	end

end
