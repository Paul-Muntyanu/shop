class Product < ActiveRecord::Base
  attr_accessible :status
  has_many :product_parameters, dependent: :destroy
  has_many :parameters, through: :product_parameters
  before_create :create_default_parameter_for_product
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  private
  def create_default_parameter_for_product
    self.parameters = categories.collect{|c| c.parameters}.flatten.uniq #Razobratsya
  end
end
