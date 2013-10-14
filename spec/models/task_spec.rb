require 'spec_helper'

describe Task do 
  before do 
    @task = Task.create!(
      url: 'http://jesseocon.com/users/new',
      exec_time: 2.hours.from_now.utc,
      executed: false,
      app_token: 'somelongstring'
    )
  end

  subject { @task }
  
  it 'should respond to the correct messages' do
    should respond_to(:url) 
    should respond_to(:exec_time)
    should respond_to(:executed) 
    should respond_to(:app_token) 
  end
  
  describe 'when the url is blank' do
    before { @task.url = '' }
    it { should_not be_valid }
  end
  
  describe 'when the exec_time is blank' do
    before { @task.exec_time = '' }
    it { should_not be_valid }
  end
  
  describe '#in_the_future' do
    
  end
end