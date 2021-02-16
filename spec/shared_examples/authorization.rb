shared_examples 'authorized endpoint' do
  context 'user is not authenticated' do
    it 'responds with a error' do
      subject

      expect(JSON.parse(last_response.body)).to eq({'error' => 'Unauthorized'})
      expect(last_response.status).to eq(403)
    end
  end
end
