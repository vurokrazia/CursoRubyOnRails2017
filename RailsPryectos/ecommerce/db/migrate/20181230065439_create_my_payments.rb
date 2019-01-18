class CreateMyPayments < ActiveRecord::Migration[5.1]
  def change
    create_table :my_payments do |t|
      t.string :email
      t.string :ip
      t.string :status
      t.decimal :price
      t.string :paypal_id
      t.decimal :total
      t.references :shopping_cart, foreign_key: true

      t.timestamps
    end
  end
end
