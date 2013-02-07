class ProductCategory < ActiveRecord::Base
  attr_accessible :category_id, :product_id
  belongs_to :category
  belongs_to :product
  validates :category_id, numericality: {only_integer: true}
  validates :product_id, numericality: {only_integer: true}
end
