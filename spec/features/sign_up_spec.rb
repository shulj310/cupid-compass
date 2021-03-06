require "rails_helper"

feature "user signs up",
%Q{As a user
 I want to sign up
 So that i can check date spots} do

# Acceptance Criteria:
 # [X] Specify a valid email
 # [X] Specify a password and confirm that password
 # [X] If i don't perform the above i get an error message
 # [X] If I specify valid information, i register my account and am validated

  scenario "specifying valid and required information" do
    user_1 = User.create(first_name: "David", last_name: "Hasselhoff", email: "theHoff1@yahoo.com", password: "password")
    location_1 = Location.create(name: "Some place", description: "Very nice place", address: "Some str.", city: "Boston", state: "MA", zip: "02116", user_id: user_1.id)
    visit root_path

    first(:link, "Sign Up").click

    expect(page).to have_content "Sign up"

    fill_in 'First name', with: "David"
    fill_in 'Last name', with: "Hasselhoff"
    fill_in 'Email', with: "theHoff@yahoo.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"

    click_button "Sign up"

    expect(page).to have_content "Sign out"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
  end

  scenario "specifying invalid and/or missing required information" do
    user_1 = User.create(first_name: "David", last_name: "Hasselhoff", email: "theHoff1@yahoo.com", password: "password")
    location_1 = Location.create(name: "Some place", description: "Very nice place", address: "Some str.", city: "Boston", state: "MA", zip: "02116", user_id: user_1.id)

    visit root_path

    first(:link, "Sign Up").click

    expect(page).to have_content "Sign up"

    fill_in 'First name', with: "David"
    fill_in 'Last name', with: "Hasselhoff"
    fill_in 'Email', with: "theHoff@yahoo.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"

    click_button "Sign up"

    expect(page).to have_content "Sign out"
    expect(page).not_to have_content "Sign Up"
    expect(page).not_to have_content "Sign In"
  end

  scenario "specifying valid and required information" do
    user_1 = User.create(first_name: "David", last_name: "Hasselhoff", email: "theHoff@yahoo.com", password: "password")
    location_1 = Location.create(name: "Some place", description: "Very nice place", address: "Some str.", city: "Boston", state: "MA", zip: "02116", user_id: user_1.id)

    #To test an alert message:
    # text = page.driver.browser.switch_to.alert.text
    # expect(text).to eq 'Message you are looking for'

    visit root_path

    first(:link, "Sign Up").click

    expect(page).to have_content "Sign up"

    fill_in 'First name', with: "David"
    fill_in 'Last name', with: "Hasselhoff"
    fill_in 'Email', with: ""
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: ""

    click_button "Sign up"

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).not_to have_content "Sign out"
    expect(page).to have_content "Sign Up"
    expect(page).to have_content "Sign In"
  end


end
