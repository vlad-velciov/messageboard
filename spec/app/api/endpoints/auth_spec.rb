describe Endpoints::Authentications do
  describe 'POST /v1/authentications' do

    context 'user is not authenticated' do
      it 'responds with a error' do
        post '/v1/authentications', email: 'foobar@barfoo.com', password: 'awesomepassword'

        expect(JSON.parse(last_response.body)).to eq({'error' => 'Unauthorized'})
        expect(last_response.status).to eq(403)
      end
    end

    context 'user gets authenticated' do
      it 'responds with a token' do
        user = create(:user)
        post '/v1/authentications', email: user.email, password: 'awesomepassword'

        expect(last_response.status).to eq 201
        expect(JSON.parse(last_response.body)).to have_key("token")
        expect(JSON.parse(last_response.body)["token"]).to be_a(String)
      end
    end
  end
end
