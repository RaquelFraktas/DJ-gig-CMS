class AddUsernameAndPasswordToBookingAgentsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :booking_agents, :username, :string
    add_column :booking_agents, :password_digest, :string
  end
end
