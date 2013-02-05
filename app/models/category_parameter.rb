class CategoryParameter < ActiveRecord::Base
  attr_accessible :category_id, :parameter_id, :status
  validates :category_id, :parameter_id, :status, presence: true
  validates :category_id, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :parameter_id, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  belongs_to :category
  belongs_to :parameter
end
