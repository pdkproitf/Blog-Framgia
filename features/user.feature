Feature: User Sign-up
  In order to create a new user
  As an member
  I need to able to create that.

@signup
  Scenario: sign_up success
    Given     I prepare a new account
    And       I on sign_up page
    When      Fill all attribute with right type and click "Create my account"
    Then      I should redirect to "/" with message "Please check your email to activate your account."

  Scenario:   sign_up false
    Given     I prepare a new account
    And       I on sign_up page
    When      Fill all attribute with wrong name "a" and click "Create my account"
    Then      I should render to "/users"  page with message "The form contains 1 error."


@login
  Scenario: login success with account actived
    Given     I have a account
    And       I activated that account
    And       I on login page
    When      I fill my account and click "Log in"
    Then      I should render to users/id page

  Scenario: login false with account haven't actived
    Given     I have a account wasn't actived
    And       I on login page
    When      i fill my account with right attribute and click "Log in"
    Then      I should render to home page "/" with message "Account not activated. Check your email for the activation link."

  Scenario: login false with email/password
    Given     I have a account
    And       I on login page
    When      I fill my account but wrong password and click "Log in"
    Then      I should render to login page "/login" with message "Invalid email/password combination"
