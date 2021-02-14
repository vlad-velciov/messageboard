FactoryBot.define do
  factory :user do
    email { 'some@email.test' }
    encrypted_password { BCrypt::Password.create("awesomepassword") }
    timezone { 'UTC' }
  end
end
