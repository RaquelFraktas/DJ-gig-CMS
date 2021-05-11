class AddUsernameAndPasswordToDjsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :djs, :username, :string
    add_column :djs, :password_digest, :string
  end
end
