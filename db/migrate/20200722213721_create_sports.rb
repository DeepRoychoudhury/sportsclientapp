class CreateSports < ActiveRecord::Migration[6.0]
  def change
    create_table :sports do |t|

      t.timestamps
    end
  end
end
