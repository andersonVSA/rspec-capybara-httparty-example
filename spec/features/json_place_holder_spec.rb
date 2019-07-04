require_relative 'api/json_place_holder_api'

feature 'The "JsonPlaceHolder" API allows users to create posts and comments' do
  body = {
    body: {
      title: 'oi',
      body: 'como vai voce',
      userId: 1
    }
  }

  let(:json_place_holder_api) { JsonPlaceHolderApi.new(body) }

  describe 'When i am a user of API' do
    before(:each) do
    end

    it 'I click on a button and remove the checkbox' do
      response = json_place_holder_api.new_post_to_posts_route
      expect(response.code).to eq 201
      expect(response.body).to include('oi', 'como vai voce', '1')
    end
  end
end
