Given(/^I need create a new account$/) do
  @user = FactoryGirl.build(:user)
end

Given(/^I on sign_up page$/) do
  visit(sign_up_path)
end

When(/^Fill all attribute with right type and click Submit$/) do
  sign_up(@user, 'Create my account')
end

Then(/^I should redirect to "([^"]*)" with message "([^"]*)"$/) do |arg1, arg2|
  expect(page.current_path).to eq arg1
  expect(page).to have_content(arg2)
end

When(/^Fill all attribute with wrong type and click Submit$/) do
  @user.name = "a"
  sign_up(@user, 'Create my account')
end

Then(/^I should render to "([^"]*)"  page with message "([^"]*)"$/) do |arg1, arg2|
  expect(page.current_path).to eq arg1
  expect(page).to have_content(arg2)
end
