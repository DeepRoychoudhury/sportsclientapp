class AddCountryAndSportsplayedToAddtoservices < ActiveRecord::Migration[6.0]
  def change
    add_column :addtoservices, :country, :string
    add_column :addtoservices, :sportsplayed, :string
  end
end
