require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
before :each do
  
  @user = User.create!(
    first_name: 'Chris',
    last_name: 'Kang',
    email:  'chriskang24@hotmail.com',
    password: 'tango123',
    password_confirmation: 'tango123'
  )

end

  scenario "Logs in the user and checks if user is actually logged in" do

  visit login_path

  save_screenshot('test4a.png')

  within('form') do
    fill_in 'email', with: 'chriskang24@hotmail.com'
    fill_in 'password', with: 'tango123'
  end

  click_button 'Submit'

  expect(page).to have_text(/Logout/i)

  save_screenshot('test4b.png')

  end


end


