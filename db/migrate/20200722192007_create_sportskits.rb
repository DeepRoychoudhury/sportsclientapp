class CreateSportskits < ActiveRecord::Migration[6.0]
  def change
    create_table :sportskits do |t|

      t.timestamps
    end
  end
end
