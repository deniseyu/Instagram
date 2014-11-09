require 'rails_helper'

describe 'Adding comments' do

  before do
    Post.create(image: File.open("#{Rails.root}/spec/helpers/images/baby-duck.jpg"))
  end

  context 'User not logged in' do
    it 'can not leave a comment' do
      visit '/'
      expect(page).not_to have_content 'Comment'
    end
  end

  context 'User logged in' do

    before do
      @user = User.create(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      login_as @user
    end

    it 'can leave a comment' do
      visit '/'
      click_link 'Comment'
      fill_in 'comment_content', with: "Coin Coin"
      click_button 'Validate comment'
      expect(page).to have_content 'test@test.com : Coin Coin'
    end
  end
end