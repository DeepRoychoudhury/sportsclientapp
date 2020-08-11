class AddProductIdToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :product_id, :int
  end
end
