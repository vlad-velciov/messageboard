## Messageboard

### Start application
1. Make a copy of the `.env.sample` file and rename it into `.env`
2. Run 
```
docker-compose run messageboard bundle exec rake db:create && docker-compose run messageboard bundle exec 
rake db:schema:load
```
3. Run `docker-compose up`

### Documentation
This application uses swagger documentation. 
1. Start application
2. Go to https://petstore.swagger.io
3. Input `http://localhost:3000/v1/swagger_doc` and click `Explore`
4. Browse around the api

### User flow
1. A user registers providing email, password and timezone. (`/v1/registrations`) 
2. He authenticates with email and password and gets a token. (`v1/authentications`)  
<i>Use the token in the authorization header: Authorization: Bearer <token> for following commands </i>
4. Send a message to yourself(use the same user id for sender and in receiver array) (`v1/messages`)
5. Retrieve the message `v1/users/:user_id/messages`
<i> Message dates should be in user time zone. </i>
6. Retrieve messages again. Already read messages should not be fetched again.

### Extra info
A message has a sender and multiple recipients. The recipients and the messages are tied together via the 
message notifications models, which can be read or not read.
Once the user fetches his messages, they are set as read, and cannot be retrieved this way again.

Authentication is done simply with a JWT token, which has some information about the user that we need (e.g.: timezone).

The business logic for using the user's timezone is in the presentation layer, as we want to work with the database
times until the very last step.
