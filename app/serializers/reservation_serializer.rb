class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :city, :reservation_date, :returning_date
  belongs_to :car
end
