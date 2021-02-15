describe Services::MessageReader do

  let(:user) { create(:user) }
  let(:message) { create(:message, sender: user) }
  let(:receiver) { create(:user) }

  before(:each) do
    message.users << receiver
    message.save
  end

  it 'reads a users messages and sets them to read' do
    service = Services::MessageReader.new(receiver.id, receiver.timezone)
    m = service.read

    expect(m.count).to eq(1)
    expect(m.first.message).to eq(message.message)
  end
end
