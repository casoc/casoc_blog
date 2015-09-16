require 'spec_helper'

describe Comment do
  
  it 'is valid with article_id, email, subject, message' do
    expect(build(:comment)).to be_valid
  end

  it 'is invalid without email' do
    expect(build(:comment, email: nil)).to have(1).errors_on(:email)
  end

  it 'is invalid without subject' do
    expect(build(:comment, subject: nil)).to have(1).errors_on(:subject)
  end

  it 'is invalid without message' do
    expect(build(:comment, message: nil)).to have(1).errors_on(:message)
  end

end
