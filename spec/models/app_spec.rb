require 'spec_helper'

describe App do
  before { @app = FactoryGirl.build(:app) }
  
  subject { @app }
  
  it 'should respond to the correct messages' do
    should respond_to(:name)
    should respond_to(:url)
    should respond_to(:verified)
    should respond_to(:api_key)
  end
  
  describe 'when the name is left blank' do
    before do 
      @app.name = ''
    end
    
    it { should_not be_valid }
  end
  
  describe 'when the url is left blank' do
    before do 
      @app.url = ''
    end
    
    it { should_not be_valid }
  end
end
