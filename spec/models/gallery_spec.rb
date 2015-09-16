require 'spec_helper'

describe Gallery do
  
  it 'is valid with image, title, alt and user_id' do
    expect(build(:gallery)).to be_valid
  end

  it 'is invalid without title' do
    expect(build(:gallery, title: nil)).to have(1).errors_on(:title)
  end

  it 'is invalid without image' do
    expect(build(:gallery, image: nil)).to have(1).errors_on(:image)
  end

end
