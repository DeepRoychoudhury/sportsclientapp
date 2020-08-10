class CreateAddtoservices < ActiveRecord::Migration[6.0]
  def change
    create_table :addtoservices do |t|

      t.timestamps
    end
  end
end
