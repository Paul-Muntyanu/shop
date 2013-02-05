class Category < ActiveRecord::Base
  attr_accessible :description, :name, :status
  validates :description, :name, :status, presence: true
  validates :description, length: {in: 10..1000}
  validates :name, length: {in: 2..20}
  has_many :category_parameters, dependent: :destroy
  has_many :parameters, through: :category_parameters
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories
  before_destroy :check_products_in_category
  before_create :add_default_fields
  validates :name, uniqueness: true




  private
  def add_default_fields
    Shop::Application.config.default_category_parameters_values.each do |def_param|
        unless p = Parameter.find_by_name(def_param)
          p = Parameter.create(name: def_param, description: 'Default description')
        end
        #binding.pry
        self.category_parameters.build(parameter_id: p.id)
    end
  end

  def check_products_in_category
    # code here
  end

end
