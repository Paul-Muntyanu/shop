class ProductParameter < ActiveRecord::Base
  attr_accessible :parameter_id, :product_id, :value
  belongs_to :product
  belongs_to :parameter
end
