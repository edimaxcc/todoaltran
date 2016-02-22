# spec/models/contact.rb
require "rails_helper"

describe Todo do
 it "has a valid Todo created with user_id" do  	
	expect(build(:todo)).to be_valid
 end
 it 'is invalid Todo without user_id' do
    expect(build(:todo, user_id: nil)).to_not be_valid
  end

end