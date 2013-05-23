class SessionsController < ApplicationController
	def create

		# this is what comes back from facebook

		@omniauth = request.env['omniauth.auth']

		# save all our user details to the session

		session[:provider] = @omniauth[:provider]
		session[:provider_id] = @omniauth[:uid]
		session[:name] = @omniauth[:info][:name]
		session[:photo_url] = @omniauth[:info][:image]

		redirect_to root_path

	end

end
