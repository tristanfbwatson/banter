class RoomsController < ApplicationController
  def index
  	@rooms = Room.all
  end

  def show
  	@room = Room.find_by_url(params[:id])
  end

  def new
  	@room = Room.new
  end

  def create
  	@room = Room.new(params[:room])
  	if @room.save
  		flash[:success] = "Yay, we've created a room"
  		redirect_to room_path(@room)
  	else
  		render "new"
  	end
  end

end
