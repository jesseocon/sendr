require 'spec_helper'

describe 'Login Pages' do
  let(:user) { FactoryGirl.create(:user, admin: false) }
  
  subject { page }
  
  describe 'signing in with invalid credentials' do
    before { signin(user, {password: 'dododododo'}, true, 'Sign In!') }
    
    it 'should display an error message' do
      should have_selector('div.alert-error')
    end
  end
  
  describe 'signing in with valid credentials' do
    before { signin(user, {}, true, 'Sign In!') }
    
    it 'should display the applications index page' do
      should have_selector('div.header', text: 'Applications')
    end
  end
  
end