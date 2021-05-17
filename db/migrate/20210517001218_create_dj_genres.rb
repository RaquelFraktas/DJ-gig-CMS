class CreateDjGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :djs_genres do |t|
      t.integer :dj_id
      t.integer :genre_id
    end
  end
end
