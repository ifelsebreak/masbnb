class ReservationsController < ApplicationController
  def index
# TODO: flats to be filtered based on search parameters entered by user
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
    @flat = find_flat
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
    params.require(:reservation).permit(:begin_date, :end_date)
  end
end
