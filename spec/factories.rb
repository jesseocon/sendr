require 'factory_girl'
FactoryGirl.define do 
  factory :task do
    url 'http://jesseocon.com/users/new'
    exec_time 2.hours.from_now.utc
    executed false
    app_token 'somelongstring'
  end
  
  factory :user do
    email                       'jesseocon@gmail.com'
    f_name                      'Jesse'
    l_name                      'Ocon'
    phone                       '8582005141'
    password                    'foobar'
    password_confirmation       'foobar'
    verified                    true
    admin                       false
  end
  
  factory :app do
    name          'Some Really Great App'
    url           'www.somereallygreaturl.com'
    verified       false
  end
end