class CreateCategoryParameters < ActiveRecord::Migration
  def change
    create_table :category_parameters do |t|
      t.boolean :status, default: true
      t.integer :category_id, references: :categories
      t.integer :parameter_id, references: :parameters

      t.timestamps
    end
  end
end
