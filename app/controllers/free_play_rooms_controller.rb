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
    @free_play_rooms = FreePlayRoom.new(free_play_room_params)
    if @free_play_rooms.save
      flash[:success] = "Booking Made!"
      redirect_to(current_sessions_path)
    else
      render('new')
    end
  end

  def edit
    @free_play_rooms = FreePlayRoom.find(params[:id])
  end
  
  def update
    @free_play_rooms = FreePlayRoom.find(params[:id])
    if @free_play_rooms.update_attributes(free_play_room_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to(current_sessions_path)
    else
      render('edit')
    end
  end

  def delete
  end
  
  def destroy
  end
  
  private
  
  def free_play_room_params
    params.require(:free_play_room).permit(:user_email, :date, :time, :duration, :user_id)
  end
end
