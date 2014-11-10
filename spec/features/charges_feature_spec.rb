require 'rails_helper'

describe 'Charging customers with Stripe' do 

  context 'User is logged in' do 

    before do
      @user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      login_as @user
      visit '/'
    end

    it 'customer can buy a picture' do 
      visit '/'
      expect(page).to have_content('Buy')
    end

  end

  context 'User is not logged in' do 

    it 'customer cannot buy a picture' do 
      visit '/'
      expect(page).not_to have_content('Buy')
    end

  end

end