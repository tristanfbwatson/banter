class MessagesController < ApplicationController
	def create
		@room = Room.find_by_url(params[:room_id])
		@message = @room.messages.new(params[:message])
		@message.name = session[:name]
		@message.provider = session[:provider]
		@message.provider_id = session[:provider_id]
		@message.photo_url = session[:photo_url]

		if @message.save
			flash[:success] = "Your message was saved"
		else
			flash[:alert] = "Your message was blank"
		end

		redirect_to room_path(@room)
	end
end
