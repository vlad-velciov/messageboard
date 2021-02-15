describe Endpoints::UserMessages do


  context 'authorized' do
    let!(:user) { create(:user) }
    let!(:token) do
      post '/v1/authentications', email: user.email, password: 'awesomepassword'
      JSON.parse(last_response.body)['token']
    end

    before(:each) do
      header 'Authorization', "Bearer: #{token}"
    end

    it 'gets unread messages' do
      get "/v1/users/#{user.id}/messages"

      expect(JSON.parse(last_response.body)).to eq([])
      expect(last_response.status).to eq(200)
    end
  end
end
