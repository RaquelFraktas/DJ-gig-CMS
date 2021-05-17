class CreateDjsGigs < ActiveRecord::Migration[5.2]
  def change
    create_table :djs_gigs do |t|
      t.integer :dj_id
      t.integer :gig_id
    end
  end
end
