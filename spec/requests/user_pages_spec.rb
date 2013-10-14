require 'spec_helper'

describe 'User pages' do
  
  before do 
    @user = User.new(
      email: 'jesseocon@gmail.com',
      f_name: 'Jesse',
      l_name: 'Ocon',
      phone: '8582005141',
      password: 'foobar',
      password_confirmation: 'foobar'
    )
  end
  
  subject { page }
  
  describe 'creating a user with correct information' do
    before do 
      visit signup_path
      fill_in 'user[f_name]',                 with: @user.f_name
      fill_in 'user[l_name]',                 with: @user.l_name
      fill_in 'user[email]',                  with: @user.email
      fill_in 'user[password]',               with: @user.password
      fill_in 'user[password_confirmation]',  with: @user.password_confirmation
    end
    
    it 'should create a user' do
      expect { click_button 'Sign Up!' }.to change(User, :count).by(1)
    end
    
  end
  
  describe 'creating a user with invalid information' do
    before do 
      visit signup_path
      fill_in 'user[f_name]',                 with: @user.f_name
      fill_in 'user[l_name]',                 with: @user.l_name
      fill_in 'user[email]',                  with: @user.email
      fill_in 'user[password]',               with: 'dopcheck'
      fill_in 'user[password_confirmation]',  with: @user.password_confirmation
    end
    
    it 'should not create a new user' do
      expect { click_button 'Sign Up!' }.not_to change(User, :count)
    end
  end
end