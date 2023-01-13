class CarSerializer < ActiveModel::Serializer
    has_many :reservations
    attributes :id, :name, :model, :description, :price, :image

end
