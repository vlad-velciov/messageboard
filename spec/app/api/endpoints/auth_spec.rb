describe Endpoints::Auth do
  describe 'POST /v1/register' do

    it 'creates a user' do
      post '/v1/auth/register', email: 'foo@foo.com', timezone: 'ts', password: 'sasdasd'

      expect(last_response.status).to eq 201
      expect(User.count).to eq 1
    end
  end


  describe 'POST /v1/auth/authenticate' do

    context 'user is authenticated' do
      it 'responds with a token' do
        user = create(:user)
        post '/v1/auth/authenticate', email: user.email, password: 'awesomepassword'

        expect(last_response.status).to eq 201
        expect(JSON.parse(last_response.body)).to have_key("token")
        expect(JSON.parse(last_response.body)["token"]).to be_a(String)
      end
    end
  end
end
