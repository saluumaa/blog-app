require 'rails_helper'

RSpec.describe Like, type: :model do
    describe 'Validations' do
        let!(:user) { User.create(name: 'Salma', photo: 'My photo', bio: 'It is Salma', posts_counter: 0) }
        let!(:post) { Post.create(title: 'Hello World', text: 'This is my first post', author: user, comments_counter: 0, likes_counter: 0) }
        subject { Like.create(post: post, author: user) }
    
        it 'increases the counter likes of the post' do
        expect { subject }.to change { post.likes_counter }.by(1)
        end
    end
    end