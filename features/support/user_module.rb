module  UserHelpers
  def sign_up user, submit
    fill_in('Name', with: user.name)
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    fill_in('Password confirmation', with: user.password_confirmation)
    click_button(submit)
  end

  def login user, submit
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button(submit)
  end
end
World(UserHelpers)
