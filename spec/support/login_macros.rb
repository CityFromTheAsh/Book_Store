module LoginMacros
  def user_login(user)
    visit root_path
    find('os-p', text: 'Log').click
    find('a', text: 'Log in').click
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    within('div', class: 'actions'){ find('input').click }
  end
end