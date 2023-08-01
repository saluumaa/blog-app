require 'rails_helper'

RSpec.describe "User show page", type: :feature do
  let!(:user) { User.create(name: 'salma', bio: "I am a software engineer", photo: "https://images.unsplash.com/photo-1612833603922-3b3b3b4b4b4b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c29mdHdhcmUlMjBlbmdpbmVlcmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80") }
  let!(:post) { Post.create(title: 'My first post', text: 'This is my first post', author: user) }
  let!(:post2) { Post.create(title: 'My second post', text: 'This is my second post', author: user) }
  let!(:post3) { Post.create(title: 'My third post', text: 'This is my third post', author: user) }
  let!(:post4) { Post.create(title: 'My fourth post', text: 'This is my fourth post', author: user) }
  before do
      visit user_path(user)
  end
  it 'displays the user name' do
      expect(page).to have_content(user.name)
  end
  it 'displays the user photo' do
      expect(page).to have_css("img[src*='#{user.photo}']")
  end
  it 'displays the user bio' do
      expect(page).to have_content(user.bio)
  end
  it 'displays the number of posts the user has' do
      expect(page).to have_content("Number of posts: #{user.posts.count}")
  end
  it 'displays the users bio' do
      expect(page).to have_content(user.bio)
  end
  it 'displays the users first 3 posts' do
      expect(page).to have_content(post.title)
      expect(page).to have_content(post2.title)
      expect(page).to have_content(post3.title)
  end
  it 'shows a see all button' do
      expect(page).to have_link("See all posts")
  end
  it 'redirects to the post show page when clicking on the post title' do
      click_on post.title
      expect(current_path).to eq(user_post_path(user, post))
  end
  it 'redirects to the user posts index page when clicking on the see all posts button' do
      click_on "See all posts"
      actual_path = current_path.chomp('/')
      expect(actual_path).to eq(user_posts_path(user))
  end
end
