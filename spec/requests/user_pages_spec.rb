require 'spec_helper'

describe 'User pages' do

  let(:user) { FactoryGirl.build(:user, admin: false) }
  
  subject { page }
  
  describe 'creating a user with correct information' do
    before { signup(user) }
    
    it 'should create a user' do
      expect { click_button 'Sign Up!' }.to change(User, :count).by(1)
    end
    
    describe 'what the user sees after logging in' do
      before { click_button 'Sign Up!' } 
      it 'should redirect to the user sign in page' do
        page.should have_field("email")
        page.should have_field("password")
        page.should have_button('Sign In!')
        page.should have_selector('h1', text: 'Sign in to start scheduling all the events in your app.')
        page.should have_selector('div', text: 'Thank you for signing up to Snedit')
      end
    end  
  end
  
  describe 'creating a user with invalid information' do
    
    before { signup(user, password: 'matcher', password_confirmation: 'mismatcher') }
    
    it 'should not create a new user' do
      expect { click_button 'Sign Up!' }.not_to change(User, :count)
    end
    
    describe 'what the user sees after trying to sign up with invalid info' do
      before { click_button 'Sign Up!' }
      it 'should render the new template in the error state' do
        page.should have_selector('div.alert-error')
      end
    end
  end
end