# spec/models/addtoservice_spec.rb

require 'rails_helper'

RSpec.describe Addtoservice, :type => :model do
 data {
    described_class.new(country: "Anything",
                        sportsplayed: "Lorem ipsum",
                        user_id: '1')
  }

  it "is valid with valid attributes" do
    expect(Addtoservice.new(data)).to be_valid
  end
  it "is not valid without a country"
  it "is not valid without a sportsplayed"
  it "is not updatable through normal user"
end