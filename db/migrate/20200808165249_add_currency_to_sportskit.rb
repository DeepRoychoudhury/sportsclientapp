class AddCurrencyToSportskit < ActiveRecord::Migration[6.0]
  def change
    add_column :sportskits, :price, :float
  end
end
