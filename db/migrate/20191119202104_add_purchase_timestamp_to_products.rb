class AddPurchaseTimestampToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :purchase_timestamp, :datetime, null: true
  end
end
