require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    let(:user) { User.create(name: 'Salma', photo: 'My photo', bio: 'It is Salma', posts_counter: 0) }
    subject do
      Post.create(title: 'Hello World', text: 'This is my first post', author: user, comments_counter: 0,
                  likes_counter: 0)
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid if the text is longer than 250 characters' do
      subject.text = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'is not valid if the comments_counter is not an integer' do
      subject.comments_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'is not valid if the comments_counter is less than 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid if the likes_counter is not an integer' do
      subject.likes_counter = 'a'
      expect(subject).to_not be_valid
    end

    it 'is not valid if the likes_counter is less than 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'counter likes of the post' do
      expect { subject.save }.to change { user.posts_counter }.by(1)
    end

    it 'returns the 5 most recent comments' do
      subject.save
      user2 = User.create(name: 'Salma', photo: 'My photo', bio: 'It is Salma', posts_counter: 0)
      Comment.create(text: 'This is my first comment', author: user2, post: subject)
      Comment.create(text: 'This is my second comment', author: user2, post: subject)
      Comment.create(text: 'This is my third comment', author: user2, post: subject)
      Comment.create(text: 'This is my fourth comment', author: user2, post: subject)
      Comment.create(text: 'This is my fifth comment', author: user2, post: subject)
      Comment.create(text: 'This is my sixth comment', author: user2, post: subject)
      expect(subject.recent_comment_count).to eq(Comment.all.order(created_at: :desc).limit(5))
    end
  end
end
