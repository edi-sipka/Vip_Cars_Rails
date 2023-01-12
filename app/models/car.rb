class Car < ApplicationRecord
  has_many :users, through: :reservations, dependent: :destroy
  has_many :reservatios, dependent: :destroy

  validates :name, presence :true
  validates :image, presence :true
  validates :model, presence :true
  validates :price, presence :true , numericality: { greater_than: 0 }
  validates :description, presence :true

  end
  