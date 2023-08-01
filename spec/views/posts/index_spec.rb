require 'rails_helper'

RSpec.describe "User post index page", type: :feature do
  let!(:user) { User.create(name: 'salma', bio: "I am a software engineer", photo: "https://images.unsplash.com/photo-1612833603922-3b3b3b4b4b4b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c29mdHdhcmUlMjBlbmdpbmVlcmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80") }
  let!(:post) { Post.create(title: 'My first post', text: 'This is my first post', author: user) }
  let!(:comment) { Comment.create(text: 'This is my first comment', author: user, post: post) }
  let!(:like) { Like.create(author: user, post: post) }

  before do
    visit user_posts_path(user)
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

  it 'displays the posts title' do
    expect(page).to have_content(post.title)
  end

  it 'displays some of the posts body' do
    expect(page).to have_content(post.text)
  end

  it 'displays the first comment on the post' do
    expect(page).to have_content(comment.text)
  end

  it 'displays the number of comments the post has' do
    expect(page).to have_content("comments: #{post.comments_counter}")
  end

  it 'displays the number of likes the post has' do
    expect(page).to have_content("likes: #{post.likes_counter}")
  end

  it 'redirects to the post list page when click a single post' do
    click_link post.title
    expect(current_path).to eq(user_post_path(user.id, post.id))
  end
end
