require 'rails_helper'

describe User, :type => :model do
  let(:user) { User.create email: 'test@sot.com', password: 'password' }
  it "can create user with email and password" do
    user.email.should eq 'test@sot.com'
    user.encrypted_password.should_not eq nil
    user.encrypted_password.should_not eq ""
  end

  it "password us updated on save" do
    current_encrypted_pass = user.encrypted_password
    user.update_attributes password: 'another_password'
    current_encrypted_pass.should_not eq user.encrypted_password
  end
end
