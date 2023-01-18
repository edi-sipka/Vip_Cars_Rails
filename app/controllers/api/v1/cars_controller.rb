class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: [:show]
  before_action :authenticate_user!
  def index
    @cars = Car.all
    render json: @cars, status: :ok
  end

  def create
    return render json: { error: 'You are not allowed' }, status: :unauthorized unless @current_user.admin?

    @car = Car.new(car_params)
    if @car.save
      render json: @car
    else
      render json: { error: 'Something went wrong' }, status: :bad_request
    end
  end

  def show
    render json: @car, status: :ok
  end

  def update
    return render json: { error: 'You are not admin' }, status: :unauthorized unless @current_user.admin?

    @car = Car.find(params[:id])
    if @car.update(car_params)
      render json: @car
    else
      render json: { error: 'Something is wrong' }, status: :bad_request
    end
  end

  def destroy
    return render json: { error: 'You are not allowed' }, status: :unauthorized unless @current_user.admin?

    @car = Car.find(params[:id])
    if @car.destroy
      render json: { id: @car.id, msg: 'Car deleted successfully' }
    else
      render json: { error: 'Something went wrong' }, status: :bad_request
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :description, :model, :price, :image)
  end
end
