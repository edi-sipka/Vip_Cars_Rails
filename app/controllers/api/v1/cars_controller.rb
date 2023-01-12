class Api::V1::CarsController < ApplicationRecord
    before_action :show_car, only: [:show]

    def index
        @cars = Car.all
        render json: @cars
    end

    def :show 
        render json: @car
    end

    private

    def show_car
        @car = Car.find(params[:id])
    end
end