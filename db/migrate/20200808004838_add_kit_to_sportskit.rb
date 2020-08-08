class AddKitToSportskit < ActiveRecord::Migration[6.0]
  def change
    add_column :sportskits, :kit, :string
  end
end
