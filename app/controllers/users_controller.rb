class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			render text: "Awesome! It seems like my test app is working"

			# Instantiate a Twilio client
			client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])

			# Create and send an SMS message
			client.account.sms.messages.create(
				from: TWILIO_CONFIG['from'],
				to: @user.phone,
				body: "If you're seeing this, it must mean you have fixed all (well maybe most) of the bugs in your code. Sweet."	
				)
		else
			render :new
		end
	end

end
