require 'rails_helper'
RSpec.describe 'User index page', type: :feature do
  let!(:user) { User.create(name: 'salma', bio: 'I am a software engineer', photo: 'https://images.unsplash.com/photo-1612833603922-3b3b3b4b4b4b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c29mdHdhcmUlMjBlbmdpbmVlcmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80') }
  let!(:post) { Post.create(title: 'My first post', text: 'This is my first post', author: user) }
  before do
    visit users_path
  end
  it 'displays the user name' do
    expect(page).to have_content(user.name)
  end
  it 'displays the user photo' do
    expect(page).to have_css("img[src*='#{user.photo}']")
  end
  it 'displays the number of posts the user has' do
    expect(page).to have_content("Number of posts: #{user.posts.count}")
  end
  it 'redirects to the user show page when clicking on the user name' do
    click_on user.name
    expect(current_path).to eq(user_path(user))
  end
end
