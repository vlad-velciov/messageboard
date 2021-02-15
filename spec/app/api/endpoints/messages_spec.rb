describe Endpoints::Messages do

  describe 'POST /messages' do
    # todo extract in shared behaviour 'authenticated endpoint'
    context 'unauthorized' do
      it 'returns a 403' do
        post '/v1/messages', sender_id: 123, receiver_ids: [123, 434], message: 'Some Message'

        expect(JSON.parse(last_response.body)).to eq({'error' => 'Token invalid'})
        expect(last_response.status).to eq(403)
      end
    end

    context 'authorized' do

      let!(:user) { create(:user) }
      let!(:token) do
        post '/v1/authentications', email: user.email, password: 'awesomepassword'
        JSON.parse(last_response.body)['token']
      end

      it 'returns the message' do
        header 'Authorization', "Bearer: #{token}"
        post '/v1/messages', sender_id: 123, receiver_ids: [123, 434], message: 'Some Message'

        expect(last_response.status).to eq(201)
        expect(Message.count).to eq(1)
      end
    end
  end

end
