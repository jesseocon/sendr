include ApplicationHelper

def signup(user, attributes = {})
  attributes.each do |name, value|
    user.send("#{name}=", value)
  end
  visit signup_path
  fill_in 'user[f_name]',                 with: user.f_name
  fill_in 'user[l_name]',                 with: user.l_name
  fill_in 'user[email]',                  with: user.email
  fill_in 'user[password]',               with: user.password
  fill_in 'user[password_confirmation]',  with: user.password_confirmation
end

def signin(user, attributes = {}, submit = false, button_name = 'Sign In!')
  attributes.each do |name, value|
    user.send("#{name}=", value)
  end
  visit login_path
  fill_in "email",    with: user.email
  fill_in "password", with: user.password
  
  if submit == true 
    click_button(button_name)
  end
end