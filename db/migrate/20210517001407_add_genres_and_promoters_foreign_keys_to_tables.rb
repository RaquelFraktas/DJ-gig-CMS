class AddGenresAndPromotersForeignKeysToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :djs, :genre_id, :integer
    add_column :djs, :promoter_id, :integer
    add_column :promoters, :dj_id, :integer
  end
end
