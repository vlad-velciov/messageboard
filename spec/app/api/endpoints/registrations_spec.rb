describe Endpoints::Authentications do
  describe 'POST /v1/registrations' do

    it 'creates a user' do
      post '/v1/registrations', email: 'foo@foo.com', timezone: 'ts', password: 'sasdasd'

      expect(last_response.status).to eq 201
      expect(User.count).to eq 1
    end
  end
end
