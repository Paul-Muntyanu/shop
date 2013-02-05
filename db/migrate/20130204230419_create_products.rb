class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :status, default: true
      t.integer :category_id

      t.timestamps
    end
  end
end
