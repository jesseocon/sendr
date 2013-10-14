require 'spec_helper'

describe User do
  before do 
    @user = FactoryGirl.build(:user)
  end
  
  subject { @user }
  
  it 'should respond to the correct messages' do
    should respond_to(:f_name) 
    should respond_to(:l_name) 
    should respond_to(:email) 
    should respond_to(:password) 
    should respond_to(:password_confirmation) 
    should respond_to(:auth_token) 
    should respond_to(:phone) 
    should respond_to(:password_reset_token) 
    should respond_to(:password_reset_at) 
    should respond_to(:verification_token) 
    should respond_to(:verified) 
    should respond_to(:last_4_digits) 
    should respond_to(:stripe_id) 
    should respond_to(:admin)
  end 
  
  describe 'when the user first name is left blank' do
    before { @user.f_name = "" }
    it { should_not be_valid }
  end
  
  describe 'when the user first name is too long' do
    before { @user.f_name = "a" * 31 }
    it { should_not be_valid }
  end
  
  describe 'when the user first name is too short' do
    before { @user.f_name = "a" }
    it { should_not be_valid }
  end
  
  describe 'when the user last name is left blank' do
    before { @user.l_name = "" }
    it { should_not be_valid }
  end
  
  describe 'when the user last name is too short' do
    before { @user.l_name = "a" }
    it { should_not be_valid }
  end
  
  describe 'when the user last name is too long' do
    before { @user.l_name = "a" * 31 }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do 
    before { @user.email = "" }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com @foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end
  
  describe "when email format is valid" do 
    it "should be valid" do 
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end
  
  describe "when email address is already taken" do 
    before do 
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    
    it { should_not be_valid }
  end
  
  describe "when password is not present" do 
    before { @user.password = @user.password_confirmation = "" }
  end
  
  describe "when password is mismatch" do 
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "when password confirmation is nil" do 
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe "return value of authenticate method" do 
    before { @user.save }
    let (:found_user) { User.find_by_email(@user.email) }
    
    describe "with valid password" do 
      it { should == found_user.authenticate(@user.password) }
    end
    
    describe "with invalid password" do 
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
    end
  end
  

end