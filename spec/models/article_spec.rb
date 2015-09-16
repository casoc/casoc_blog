require 'spec_helper'

describe Article do
  
  it 'is valid with title, context, gallery_id' do
    expect(build(:article)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:article, title: nil)).to have(1).errors_on(:title)
  end

end
