require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /index' do
    it 'renders a successful response' do
      get user_posts_path(2)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_posts_path(2)
      expect(response).to render_template('index')
    end

    it 'includes correct placeholder text' do
      get user_posts_path(2)
      expect(response.body).to include('<p> Here is a list of posts by user ID </p>')
    end
  end
  context 'GET /show' do
    it 'renders a successful response' do
      get user_post_url(1, 5)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_post_url(1, 5)
      expect(response).to render_template('show')
    end

    it 'includes correct placeholder text' do
      get user_post_url(1, 5)
      expect(response.body).to include('<p> Here is a list of all posts: </p>')
    end
  end
end