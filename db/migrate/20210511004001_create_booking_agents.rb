class CreateBookingAgents < ActiveRecord::Migration
  def change
    create_table :booking_agents do |t|

      t.timestamps null: false
    end
  end
end
