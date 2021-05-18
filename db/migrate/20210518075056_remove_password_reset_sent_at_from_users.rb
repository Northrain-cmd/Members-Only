class RemovePasswordResetSentAtFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password_reset_sent_at, :time
    add_column :users, :password_reset_sent_at, :datetime
  end
end
