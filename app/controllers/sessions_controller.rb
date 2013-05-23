class SessionsController < ApplicationController
	def create

		# this is what comes back from facebook

		@omniauth = request.env['omniauth.auth']

		# save all our user details to the session

		session[:provider] = @omniauth[:provider]
		session[:provider_id] = @omniauth[:uid]
		session[:name] = @omniauth[:info][:name]
		session[:photo_url] = @omniauth[:info][:image]

		Pusher['banter'].trigger("logged_in", {
			name: session[:name]
			})

		redirect_to root_path

	end

	def destroy
		Pusher['banter'].trigger("logged_out", {
			name: session[:name]
			})

		reset_session
		redirect_to root_path
	end

end
