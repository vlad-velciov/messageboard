describe Endpoints::Messages do

  describe 'POST /messages' do
    context 'unauthorized' do
      subject { post '/v1/messages', sender_id: 123, receiver_ids: [123, 434], message: 'Some Message' }
      it_behaves_like 'authorized endpoint'
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
