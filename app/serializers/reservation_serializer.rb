class ReservationSerializer < ActiveModel::Serializer
    belongs_to :car
    attributes :id, :city, :reservation_date, :returning_date
end
