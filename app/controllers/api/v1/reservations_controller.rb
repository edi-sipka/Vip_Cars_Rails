class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user.reservations.includes([:car]).order(id: :desc), status: :ok
  end
  private
  def reservation_params
    params.require(:reservation).permit(:reservation_date, :returning_date, :car_id)
  end
end
