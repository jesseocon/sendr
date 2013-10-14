require 'spec_helper'

describe App do
  before do 
    @app = App.create(
      name: 'Cool Application',
      url: 'http://somebadassurl.com'
    )
  end
  
  subject { @app }
  
  it { should respond_to(:name) }
  it { should respond_to(:url) }
  it { should respond_to(:verified) }
  it { should respond_to(:api_key) }
  
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
