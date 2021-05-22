class AddResetPasswordToTUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reset_password_token, :string
    add_column :users, :password_reset_sent_at, :time
    add_index :users, :reset_password_token
  end
end
