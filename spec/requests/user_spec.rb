require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'renders a successful response' do
      get users_path
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get users_path
      expect(response).to render_template('users/index')
    end

    it 'includes correct placeholder text' do
      get users_path
      expect(response.body).to include('<h1>List of Users</h1>')
    end
  end

  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'Salma Hassan') }

    it 'renders a successful response' do
      get user_path(user)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_path(user)
      expect(response).to render_template('users/show')
    end

    it 'includes correct placeholder text' do
      get user_path(user)
      expect(response.body).to include('<p>Here is a list of user with the given ID </p>')
    end
  end
end
