FactoryGirl.define do 
  factory :task do
    url 'http://jesseocon.com/users/new'
    exec_time 2.hours.from_now.utc
    executed false
    app_token 'somelongstring'
  end
end