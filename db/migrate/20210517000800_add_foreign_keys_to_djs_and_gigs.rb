class AddForeignKeysToDjsAndGigs < ActiveRecord::Migration[5.2]
  def change
    add_column :djs, :gig_id, :integer
    add_column :gigs, :dj_id, :integer
  end
end
