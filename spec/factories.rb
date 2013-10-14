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
end

# create_table "users", :force => true do |t|
#   t.string   "email"
#   t.string   "f_name"
#   t.string   "l_name"
#   t.string   "phone"
#   t.string   "password_digest"
#   t.string   "auth_token"
#   t.string   "password_reset_token"
#   t.datetime "password_reset_at"
#   t.string   "verification_token"
#   t.boolean  "verified"
#   t.string   "last_4_digits"
#   t.string   "stripe_id"
#   t.boolean  "admin"
#   t.datetime "created_at",           :null => false
#   t.datetime "updated_at",           :null => false
# end