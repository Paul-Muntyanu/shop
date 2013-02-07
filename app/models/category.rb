class Category < ActiveRecord::Base
  attr_accessible :description, :name, :status
  before_destroy :check_products_in_category
  validates :description, :name, :status, presence: true
  validates :description, length: {in: 10..1000}
  validates :name, length: {in: 2..20}
  has_many :category_parameters, dependent: :destroy
  has_many :parameters, through: :category_parameters
  has_many :product_categories, dependent: :destroy
  has_many :products, through: :product_categories
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

  def check_products_in_category(cat_to = nil)
    if ((self.products.all.count > 0)&&(cat_to.nil?))
      check_or_create_unauthorized_category(self.parameters.pluck(:name))
      move_product_from_one_category_to_another(self, Category.find_by_name('Unauthorized'))
    else if ((self.products.all.count > 0)&&(!cat_to.nil?))
     #TODO: write how to change category of the product
    end
    end
  end
  #TODO:: add ability to create category for flowing through ui
  def check_or_create_unauthorized_category(cat_params)
    new_cat = Category.find_or_create_by_name('Unauthorized')
    add_this_params = cat_params - new_cat.parameters.all
    add_this_params.each do |param_to_create|
      new_cat.parameters.create(param_to_create)
      return new_cat
    end
  end

  def move_product_from_one_category_to_another(cat_from, cat_to)
      cat_from.products.each do |product|
        new_product = product.product_categories.create(category_id: cat_to.id)
        product.parameters.each do |key, value|
          new_product.parameter.where(name: key).product_parameter.value = value
        end
      end

  end
end
