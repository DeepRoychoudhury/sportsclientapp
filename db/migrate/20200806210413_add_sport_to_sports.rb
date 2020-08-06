class AddSportToSports < ActiveRecord::Migration[6.0]
  def change
    add_column :sports, :sport, :string
  end
end
