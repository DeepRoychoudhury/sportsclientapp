class CreateSportswises < ActiveRecord::Migration[6.0]
  def change
    create_table :sportswises do |t|
      t.string :sportskit
      t.references :sports, null: false, foreign_key: true

      t.timestamps
    end
  end
end
