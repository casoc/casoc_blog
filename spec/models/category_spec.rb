require 'spec_helper'

describe Category do
  
  it 'is valid with name and user_id' do
    expect(build(:category)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:category, name: nil)).to have(1).errors_on(:name)
  end

end
