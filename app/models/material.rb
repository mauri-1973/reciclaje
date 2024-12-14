class Material < ApplicationRecord
  belongs_to :recycler
  has_many :deliveries
  validates :name, :description, presence: true
end
