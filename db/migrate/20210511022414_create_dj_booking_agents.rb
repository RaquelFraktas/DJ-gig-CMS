class CreateDjBookingAgents < ActiveRecord::Migration[5.2]
  def change
  
    create_table :user_items do |t|
      t.integer :dj_id
      t.integer :booking_agent_id
      t.timestamps null: false
    end
  end
  
end
