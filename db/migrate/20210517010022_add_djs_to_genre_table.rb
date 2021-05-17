class AddDjsToGenreTable < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :dj_id, :integer
  end
end
