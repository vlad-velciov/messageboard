module Endpoints
  class Messages < Grape::API

    namespace :messages do

      get do


        puts 'asdasd'

        m = Message.new
        m.message = 'foo'
        user = User.new
        user.email = 'foo@goo.com'
        m.receiver = user
        m.sender = user
        present m, with: Entities::Message
        # authenticate token
        # get timezone from token
        # get messages with timezone
      end

      put do
        present {}
        # update to read
        # how do i update only if one user read, so that others can still read it ?
      end
    end
  end
end
