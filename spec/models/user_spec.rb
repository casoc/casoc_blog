require 'spec_helper'

describe User do

  it 'is valid with user_name, password and email' do
    expect(build(:user)).to be_valid
  end
  
  it 'is invalid without a user_name' do
    expect(build(:user, user_name: nil)).to have(1).errors_on(:user_name)
  end

  it 'is invalid without a password' do
    expect(build(:user, password: nil)).to have(2).errors_on(:password)
  end

  it 'is invalid without a email' do
    expect(build(:user, email: nil)).to have(2).errors_on(:email)
  end

  it 'is invalid with email format' do
    expect(build(:user, email: 'not_a_email')).to have(1).errors_on(:email)
  end

  it 'is invalid with duplicate email' do
    create(:user, email: 'casocroz@gmail.com')
    expect(build(:user, email: 'casocroz@gmail.com')).to have(1).errors_on(:email)
  end

end
