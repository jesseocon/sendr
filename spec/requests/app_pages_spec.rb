require 'spec_helper'

describe 'App Pages' do
  let(:user) { FactoryGirl.create(:user, admin: false) }
  let(:other_user) { FactoryGirl.create(:user, admin: false, email: 'jessesocons@gmail.com') }
  let(:app) { FactoryGirl.create(:app, user_id: user.id) }
  let(:other_app) { FactoryGirl.create(:app, name: 'awesomo', url: 'www.bsurl.com', user_id: other_user.id) }
  
  subject { page }
  
  describe 'Viewing the apps pages as a signed in user' do
    
    it 'should display the correct apps' do
      signin(user, attributes = {}, submit = true, button_name = 'Sign In!')
      should have_selector('div', text: 'Applications')
      should have_selector('ul.mid-menu')
      should have_link('My Apps', href: user_apps_path(user))
      should have_link('Create an App', href: new_user_app_path(user))
      
      App.readable_by(user.id).each do |app|
        page.should have_link(app.name, href: edit_user_app_path(user, app))
      end
      
      App.readable_by(other_user.id).each do |app|
        page.should_not have_link(other_app.name, href: edit_user_app_path(other_user, other_app))
      end
    end
    
    describe 'the apps#new page' do 
      it 'should display the correct elements' do
        signin(user, attributes = {}, submit = true, button_name = 'Sign In!')
        visit new_user_app_path(user)
        should have_button('Create Application')
        fill_in 'app[name]', with: 'Even better name'
        fill_in 'app[url]', with: 'http://evenbetterurl.com'
        expect { click_button('Create Application') }.to change(App, :count).by(1)
      end
    end
    
    # new and index
    describe "trying to view someone yours and someone elses pages" do
      
      it 'should display a warning message' do
        signin(user, attributes = {}, submit = true, button_name = 'Sign In!')
        visit new_user_app_path(other_user)
        should have_selector('div.alert-error', text: 'Not Authorized!')
        visit user_apps_path(other_user)
        should have_selector('div.alert-error', text: 'Not Authorized!')
      end
      
    end
    
  end
end