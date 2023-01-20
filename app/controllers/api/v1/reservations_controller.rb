class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user.reservations.includes([:car]).order(id: :desc), status: :ok
  end
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = @current_user
    if @reservation.save
      render json: @reservation
    else
      render json: { error: 'Something went wrong' }, status: :bad_request
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])

    if reservation.destroy
      render json: {
        status: 200,
        message: 'Reservation cancelled',
        data: ReservationSerializer.new(reservation)
      }, status: :ok
    else
      render json: { error: 'ERROR: Unable to cancel the reservation' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :returning_date, :car_id)
  end
end
