class AddGigsToPromoters < ActiveRecord::Migration[5.2]
  def change
    add_column :promoters, :gig_id, :integer
    add_column :gigs, :promoter_id, :integer
  end
end
