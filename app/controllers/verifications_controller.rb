class VerificationsController < ApplicationController

before_filter :get_user

def create
	@user.update_attribute(:verified, true)
	#send another message acknowledging the verification
	head :ok
end

private
def get_user
	unless @user = User.find_by_phone(params["From"])
		head :not_found
	end
end

end
