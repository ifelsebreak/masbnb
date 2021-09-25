class ReservationsController < ApplicationController
  def index
    # TODO: reservation to be filtered based on search parameters entered by user
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    find_flat
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.flat = find_flat
    @reservation.save
    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  def reservation_params
    # TODO pass begin and end date from home search
    { "begin_date" => "26-09-2021", "end_date" => "28-09-2021" }
    # params.require(:reservation).permit(:begin_date, :end_date)
  end
end
