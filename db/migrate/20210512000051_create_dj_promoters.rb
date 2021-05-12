class CreateDjPromoters < ActiveRecord::Migration[5.2]
  def change
    create_table :dj_promoters do |t|
      t.integer :dj_id
      t.integer :promoter_id
      t.timestamps null: false
    end
  end
end
