class FreePlayRoomsController < ApplicationController
  def index
    @free_play_rooms = FreePlayRoom.all
  end

  def show
    @free_play_rooms = FreePlayRoom.find(params[:id])
  end

  def new
    @free_play_rooms = FreePlayRoom.new
  end
  
  def create
  end

  def edit
  end
  
  def update
  end

  def delete
  end
  
  def destroy
  end
end
