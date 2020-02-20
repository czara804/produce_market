class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.date :date_available
      t.integer :quantity
      t.integer :price
      t.text :description
      t.boolean :available

      t.timestamps
    end
  end
end
