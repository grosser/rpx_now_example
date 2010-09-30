Given /^the following users:$/ do |users|
  User.create!(users.hashes)
end

Given /^I am logged in as "([^"]*)"$/ do |user_name|
  user = User.find_by_name(user_name)
  
  cookies = Capybara.current_session.driver.current_session.instance_variable_get(:@rack_mock_session).cookie_jar
  cookies[:stub_user_id] = user.id
end
