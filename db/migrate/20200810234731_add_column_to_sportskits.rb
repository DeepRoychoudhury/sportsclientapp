class AddColumnToSportskits < ActiveRecord::Migration[6.0]
  def change
    add_column :sportskits, :currency, :string
  end
end
