describe Services::MessageReader do

  let(:user) { create(:user) }
  let(:message) { create(:message, sender: user) }
  let(:receiver) { create(:user, timezone: 'American Samoa') }

  before(:each) do
    message.users << receiver
    message.save
  end

  it 'reads a users messages and sets them to read' do
    read_messages = Services::MessageReader.call(receiver.id, receiver.timezone)

    expect(read_messages.count).to eq(1)
    expect(read_messages.first.message).to eq(message.message)
  end

  it 'a once read message is not read again' do
    _first_time_read = Services::MessageReader.call(receiver.id, receiver.timezone)
    second_time_read = Services::MessageReader.call(receiver.id, receiver.timezone)

    expect(second_time_read.count).to eq(0)
  end
end
