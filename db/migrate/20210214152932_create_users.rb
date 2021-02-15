class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :timezone

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
