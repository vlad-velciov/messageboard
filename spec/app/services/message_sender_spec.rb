describe Services::MessageSender do


  describe "#call" do

    it 'creates notifications for all receivers' do
      message = 'random message'

      user = create(:user)
      user2 = create(:user)
      receiver_ids = [user.id, user2.id]
      sender_id = 434

      Services::MessageSender.call(sender_id, receiver_ids, message)
      message_notifications = MessageNotification.all
      expect(message_notifications.count).to eq(2)
    end
  end
end
