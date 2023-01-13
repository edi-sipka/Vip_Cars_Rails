class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: [:show]

  def index
    @cars = Car.all
    render json: @cars, status: :ok
  end

  def show
    render json: @car, status: :ok
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end
end
