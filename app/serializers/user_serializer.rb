class UserSerializer < ActiveModel::Serializer
  has_many :reservations
  attributes :id, :name, :email
end
