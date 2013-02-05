# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Shop::Application.initialize!

#Default configuration values

Shop::Application.configure do
  config.default_category_parameters_values = %w{
name
descriptions
status
price
box_qty
size
box_size
moq
arrive_date
  }
end
