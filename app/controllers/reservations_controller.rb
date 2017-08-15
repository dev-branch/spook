class ReservationsController < ApplicationController
  before_action :auth_user

  def index
    @reservations = Reservation.where(user_id: @user.id)
  end

  def new
    @cruises = Cruise.all
  end

  def select_cruise
    # model method

    @reservation = Reservation.new
    @cruise = Cruise.find(params[:cruise_id])
    @dates = @cruise.dates
    @rooms = @cruise.ship.cabins.where(is_available: true).map{|c| "#{c.room}/#{c.level}"}
    render 'new'
  end

  def create
    # refactor to model method

    @reservation = Reservation.new
    @cruise = Cruise.find(params[:reservation][:cruise_id])
    @reservation.date = params[:reservation][:date].to_date
    room, level = params[:reservation][:room_level].split('/')
    @reservation.room = room
    @reservation.level = level
    @reservation.cost = @cruise.base_cost + (100 * level.to_i)
    @reservation.user_id = @user.id
    @reservation.cruise_id = @cruise.id
    @reservation.save
    cabin = @cruise.ship.cabins.where(room: room, level: level).first
    cabin.update(is_available: false)
    redirect_to reservations_url
  end

  def show
  end

  def destroy
  end
end
