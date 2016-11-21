Feature: User Sign-up
  In order to create a new user
  As an member
  I need to able to create that.

  @signup_success
  Scenario: sign_up success
    Given     I need create a new account
    And       I on sign_up page
    When      Fill all attribute with right type and click Submit
    Then      I should redirect to "/" with message "Please check your email to activate your account."

  Scenario: sign_up failse
    Given     I need create a new account
    And       I on sign_up page
    When      Fill all attribute with wrong type and click Submit
    Then      I should render to "/users"  page with message "The form contains 1 error."
