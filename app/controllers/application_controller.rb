class ApplicationController < ActionController::API
	def current_moderator
	    authenticate_or_request_with_http_basic do |username, password|
	      moderator = Moderator.find_by(username: username)
	      moderator && moderator.authenticate(password)
	    end
	end
end
