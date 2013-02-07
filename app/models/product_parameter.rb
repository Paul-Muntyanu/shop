class ProductParameter < ActiveRecord::Base
  attr_accessible :parameter_id, :product_id, :value
  belongs_to :product
  belongs_to :parameter
  validates :product_id, numericality: {only_integer: true}
  validates :parameter_id, numericality: {only_integer: true}
end
