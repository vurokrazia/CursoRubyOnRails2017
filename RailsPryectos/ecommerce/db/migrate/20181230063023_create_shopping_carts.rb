class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts do |t|
      t.string :status
      t.string :ip

      t.timestamps
    end
  end
end
