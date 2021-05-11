class CreateGigs < ActiveRecord::Migration
  def change
    create_table :gigs do |t|

      t.timestamps null: false
    end
  end
end
