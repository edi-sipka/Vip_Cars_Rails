class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: current_user.reservations.includes([:car]).order(id: :desc), status: :ok
  end
end
