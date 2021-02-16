describe Endpoints::Authentications do
  describe 'POST /v1/authentications' do

    context 'user is not authenticated' do
      subject { post '/v1/authentications', email: 'foobar@barfoo.com', password: 'awesomepassword' }

      it_behaves_like 'authorized endpoint'
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
