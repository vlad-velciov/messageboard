describe Endpoints::UserMessages do

  context 'unauthorized' do
    subject { get "/v1/users/1234/messages" }
    it_behaves_like 'authorized endpoint'
  end

  context 'authorized' do
    let!(:user) { create(:user, timezone: 'American Samoa') }
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

    it 'returns an empty array if it does not find the user' do
      invalid_user_id = 12343243
      get "/v1/users/#{invalid_user_id}/messages"

      expect(JSON.parse(last_response.body)).to eq([])
      expect(last_response.status).to eq(200)
    end

    it 'gets messages with times in the user\'s own timezone' do
      Timecop.freeze(Time.local(1990)) do
        expected_time = '1989-12-31T11:00:00.000-11:00'

        message = create(:message)
        message.users << user
        message.save

        get "/v1/users/#{user.id}/messages"

        first_message = JSON.parse(last_response.body).first

        expect(first_message['created_at']).to eq(expected_time)
      end
    end
  end
end
