RSpec::Matchers.define :allow do |*args|
  match do |permission|
    permission.allow?(*args).should be_true
  end
end

describe Permission do
  describe 'permissions as an admin' do
    let(:user) { FactoryGirl.create(:user, admin: true) }
    let(:other_user) { FactoryGirl.create(:user, admin: false, email: 'jessesocons@gmail.com') }
    let(:app) { FactoryGirl.create(:app, user_id: user.id) }
    let(:other_app) { FactoryGirl.create(:app, name: 'awesomo', url: 'www.bsurl.com', user_id: other_user.id) } 
    subject { Permission.new(user) }
    
    it 'has the correct permissions for apps' do
      should allow(:apps, :edit, other_app)
      should allow(:apps, :destroy, other_app)
      should allow(:apps, :update, other_app)
      should allow(:apps, :create, other_app)
      should allow(:apps, :show, other_app)
    end
    
    it 'hash the correct permissions for users' do
      should allow(:users, :index)
      should allow(:users, :show, other_user)
      should allow(:users, :create, other_user)
      should allow(:users, :edit, other_user)
      should allow(:users, :destroy, other_user)
      should allow(:users, :new)
    end
  end
  
  describe 'permissions as user' do
    let(:user) { FactoryGirl.create(:user, admin: false) }
    let(:other_user) { FactoryGirl.create(:user, admin: false, email: 'jessesocons@gmail.com') }
    let(:app) { FactoryGirl.create(:app, user_id: user.id) }
    let(:other_app) { FactoryGirl.create(:app, name: 'awesomo', url: 'www.bsurl.com', user_id: other_user.id) } 
    subject { Permission.new(user) }
    
    # app permissions - (#index, #new should be tested in the controller as current resource
    #     is dependent on a resource id)
    it 'has the correct permissions for apps' do
      should allow(:apps, :edit, app)
      should_not allow(:apps, :edit, other_app) 
      should allow(:apps, :destroy, app) 
      should_not allow(:apps, :destroy, other_app) 
      should allow(:apps, :show, app) 
      should_not allow(:apps, :show, other_app) 
      should allow(:apps, :update, app) 
      should_not allow(:apps, :update, other_app)  
    end
    
    # user permissions    
    it 'has the correct permissions for users' do
      should_not allow(:users, :index, user) 
      should_not allow(:users, :show, other_user)  
      should allow(:users, :show, user) 
      should_not allow(:users, :edit, other_user) 
      should allow(:users, :edit, user) 
      should_not allow(:users, :update, other_user) 
      should allow(:users, :update, user) 
      should_not allow(:users, :destroy, other_user) 
      should allow(:users, :destroy, user) 
    end
  end
  
  describe 'permissions as a guest(not logged in)' do 
    let(:user) { FactoryGirl.create(:user, admin: false) }
    let(:other_user) { FactoryGirl.create(:user, admin: false, email: 'jessesocons@gmail.com') }
    let(:app) { FactoryGirl.create(:app, user_id: user.id) }
    let(:other_app) { FactoryGirl.create(:app, name: 'awesomo', url: 'www.bsurl.com', user_id: other_user.id) } 
    subject { Permission.new(nil) }
     
    it 'has the correct permissions' do
      # resetting password
      should allow(:password_resets, :new)
      should allow(:password_resets, :create)
      should allow(:password_resets, :edit)
      should allow(:password_resets, :update)
      
      # logging in
      should allow(:sessions, :create)
      should allow(:sessions, :destroy)
      should allow(:sessions, :new)
      
      # setting up account
      should allow(:users, :new)
      should allow(:users, :create)
      should_not allow(:users, :show, user)
      should_not allow(:users, :edit, user)
      should_not allow(:users, :update, user)
      should_not allow(:users, :destroy, user)
      
      # verifying account
      should allow(:verifications, :show)
      
      # apps 
      should_not allow(:apps, :index)
      should_not allow(:apps, :new)
      should_not allow(:apps, :edit, app)
      should_not allow(:apps, :update, app)
      should_not allow(:apps, :create, app)
      should_not allow(:apps, :destroy, app)  
    end
  end
 
  
  
end

























