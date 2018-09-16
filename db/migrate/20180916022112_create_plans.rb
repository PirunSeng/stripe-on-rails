class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.integer :price
      t.string :name
      t.string :description
    end
  end
end
