class CreatePromotersGigs < ActiveRecord::Migration[5.2]
  def change
    create_table :promoters_gigs do |t|
      t.integer :promoter_id
      t.integer :gig_id
    end
  end
end
