class Delivery < ApplicationRecord
  belongs_to :material
  belongs_to :recycler
  validates :delivery_date, :quantity, presence: true
end
