require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Validations' do
    let!(:user) { User.create(name: 'Salma', photo: 'My photo', bio: 'It is Salma', posts_counter: 0) }
    let!(:post) { Post.create(title: 'Hello World', text: 'This is my first post', author: user, comments_counter: 0, likes_counter: 0) }
    let(:comment_text) { 'This is my first comment' }
    subject { Comment.create(text: comment_text, post: post, author: user) }

    it 'is valid without a text' do
      subject.text = nil
      expect(subject).to be_valid
    end

    it 'increases the counter comments of the post' do
      expect { subject }.to change { post.comments_counter }.by(1)
    end
  end
end
