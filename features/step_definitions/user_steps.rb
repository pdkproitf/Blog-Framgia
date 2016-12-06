# ************************sign up***********************************************
Given(/^I prepare a new account$/) do
  @user = FactoryGirl.build(:user)
end

Given(/^I on sign_up page$/) do
  visit(sign_up_path)
end

When(/^Fill all attribute with right type and click "([^"]*)"$/) do |arg1|
  sign_up(@user, arg1)
end

Then(/^I should redirect to "([^"]*)" with message "([^"]*)"$/) do |arg1, arg2|
  expect(page.current_path).to eq arg1
  expect(page).to have_content(arg2)
end

When(/^Fill all attribute with wrong name "([^"]*)" and click "([^"]*)"$/) do |arg1, arg2|
  @user.name = arg1
  sign_up(@user, arg2)
end

Then(/^I should render to "([^"]*)"  page with message "([^"]*)"$/) do |arg1, arg2|
  expect(page.current_path).to eq arg1
  expect(page).to have_content(arg2)
end

# ************************login*************************************************
#success full
Given(/^I have a account$/) do
  @user = FactoryGirl.create(:user)
end

Given(/^I activated that account$/) do
  User.first.toggle!(:activated)
end


When(/^I fill my account and click "([^"]*)"$/) do |arg1|
  login(@user, arg1)
end

Then(/^I should render to users\/id page$/) do
  expect(page.current_path).to eq "/users/#{@user.id}"
end

# account wasn't actived
Given(/^I have a account wasn't actived$/) do
  @user = FactoryGirl.create(:user)
end

Given(/^I on login page$/) do
  visit(login_path)
end

When(/^i fill my account with right attribute and click "([^"]*)"$/) do |arg1|
  login(@user, 'Log in')
end

Then(/^I should render to home page "([^"]*)" with message "([^"]*)"$/) do |arg1, arg2|
    expect(page.current_path).to eq arg1
    expect(page).to   have_content(arg2)
end

# wrong attribute
When(/^I fill my account but wrong password and click "([^"]*)"$/) do |arg1|
  @user.password = "a"
  login(@user, 'Log in')
end

Then(/^I should render to login page "([^"]*)" with message "([^"]*)"$/) do |arg1, arg2|
  expect(page.current_path).to eq arg1
  expect(page).to   have_content(arg2)
end
