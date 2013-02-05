class Parameter < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, presence: true
  validates :description, length: {in: 5..1000}
  has_many :category_parameters
  has_many :product_parameters
  # belongs_to :category, through: :category_parameters #? i do not now but i think this is right
end
