class AddSportIdToSportskit2 < ActiveRecord::Migration[6.0]
  def change
    add_reference :sportskits, :sport, null: false, foreign_key: true
  end
end
