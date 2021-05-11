class CreateBookingAgents < ActiveRecord::Migration
  def change
    create_table :booking_agents do |t|
      t.string :name
      t.string :based_in

      t.timestamps null: false
    end
  end
end
