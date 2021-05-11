class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|
      t.string :name
      t.string :venue
      t.string :city

      t.timestamps null: false
    end
  end
end
