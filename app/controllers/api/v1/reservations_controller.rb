class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
