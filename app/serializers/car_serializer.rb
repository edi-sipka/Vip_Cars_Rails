class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :model, :description, :price, :image
end
