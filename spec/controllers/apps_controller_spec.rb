include SessionsHelper
require 'spec_helper'

describe AppsController do
  let(:user) { FactoryGirl.create(:user, admin: false) }
  let(:app) { FactoryGirl.create(:app) }
  let(:other_user)
  
end