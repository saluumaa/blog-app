require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let!(:user) { User.create(name: 'salma', bio: 'I am a software engineer', photo: 'https://images.unsplash.com/photo-1612833603922-3b3b3b4b4b4b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c29mdHdhcmUlMjBlbmdpbmVlcmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80') }
  let!(:post) { Post.create(title: 'My first post', text: 'This is my first post', author: user) }
  let!(:comment1) { Comment.create(text: 'First comment', author: user, post:) }
  let!(:comment2) { Comment.create(text: 'Second comment', author: user, post:) }
  let!(:like1) { Like.create(author: user, post:) }
  let!(:like2) { Like.create(author: user, post:) }

  before do
    visit user_post_path(user, post)
  end

  it 'displays the post title' do
    expect(page).to have_content(post.title)
  end

  it 'displays the post author' do
    expect(page).to have_content(post.author.name)
  end

  it 'displays the number of comments the post has' do
    expect(page).to have_content("Comments: #{post.comments.count}")
  end

  it 'displays the number of likes the post has' do
    expect(page).to have_content("Likes: #{post.likes.count}")
  end

  it 'displays the post body' do
    expect(page).to have_content(post.text)
  end

  it 'displays the username of each commentor' do
    expect(page).to have_content(comment1.author.name)
    expect(page).to have_content(comment2.author.name)
  end

  it 'displays the comment left by each commentor' do
    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end
end
