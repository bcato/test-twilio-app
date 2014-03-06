class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			render text: "Awesome! It seems like my test app is working"
		else
			render :new
		end
	end

end
