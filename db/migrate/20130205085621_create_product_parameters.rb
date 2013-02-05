class CreateProductParameters < ActiveRecord::Migration
  def change
    create_table :product_parameters do |t|
      t.integer :product_id
      t.integer :parameter_id
      t.string :value

      t.timestamps
    end
  end
end
