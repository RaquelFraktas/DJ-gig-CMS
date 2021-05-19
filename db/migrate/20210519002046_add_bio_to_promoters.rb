class AddBioToPromoters < ActiveRecord::Migration[5.2]
  def change
      add_column :promoters, :bio, :string
      
  end
end
