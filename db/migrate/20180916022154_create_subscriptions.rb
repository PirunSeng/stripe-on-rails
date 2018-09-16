class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :plan, foreign_key: true
      t.string :name
      t.string :email
      t.string :stripe_customer_token
    end
  end
end
