class Users < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: false do |t|
      t.column :id, 'varchar(26)', null: false, primary_key: true
      t.bigint :partition_key, null: false, auto_increment: true, index: true, limit: 20, comment: 'Sequential number for analysis'
      t.string :first_name, null: false, limit: 255, comment: 'First Name'
      t.string :last_name, null: false, limit: 255, comment: 'Last Name'
      t.string :email, null: false, limit: 255, comment: 'Email address'
      t.string :password, null: false, limit: 255, comment: 'Encrypted Password'
      t.string :reset_password_token, limit: 255, comment: 'Reset Password Token'
      t.datetime :reset_password_sent_at, comment: 'Reset Password Sent At'
      t.datetime :remember_created_at, comment: 'Remember Created At'

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
