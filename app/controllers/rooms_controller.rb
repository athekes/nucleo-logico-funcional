class RoomsController < ApplicationController
  before_action :set_room, only: %i[ update destroy ]

  # GET /rooms
  def index
    @rooms = Room.all

    render json: @rooms
  end

  # GET /rooms/jacare
  def show
    @room = Room.find_by(code: params[:id])
    render json: @room
  end

  # POST /rooms
  def create
    room_name = ActionController::Parameters.new({code: Room::Name::Find.call, questionaire: Questionaire.first}).permit!
    @room = Room.new(room_params.merge(room_name))

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.fetch(:room, {}).permit!
  end
end
