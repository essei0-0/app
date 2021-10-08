class Api::V1::RoomsController < ApplicationController
  def index
    rooms = Room.all
    render json: rooms
  end

  def show
    room = Room.find(params[:id])
    render json: room
  end

  def comments
    room = Room.find(params[:id])
    comments = room.comments
    render json: comments
  end
end
