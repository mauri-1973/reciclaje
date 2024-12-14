class Delivery < ApplicationRecord
  belongs_to :material
  belongs_to :recycler
  validates :material_id, presence: true
  validates :delivery_date, :quantity, presence: true
end
