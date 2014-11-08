require 'rails_helper'

context 'user not signed in and on the homepage' do

  it 'should see a "Log in" and a "Sign up" link' do
    visit '/'
    expect(page).to have_link ("Log in")
    expect(page).to have_link ("Sign up")
  end

  it 'should not see "Log out" link' do
    visit '/'
    expect(page).not_to have_link ("Sign out")
  end
end

context 'user signed in on the homepage' do

  before do
    visit '/'
    click_link ("Sign up")
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button ("Sign up")
  end

  it 'should see "Sign out" link' do
    expect(page).to have_link("Sign out")
  end

  it 'should not see a "Log in" and "Sign up" link' do
    expect(page).not_to have_link ("Log in")
    expect(page).not_to have_link ("Sign up")
  end

end
