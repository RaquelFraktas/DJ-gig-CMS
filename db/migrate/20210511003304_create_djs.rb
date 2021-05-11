class CreateDjs < ActiveRecord::Migration
  def change
    create_table :djs do |t|
      t.string :name
      t.string :based_in
      t.string :bio

      t.timestamps null: false
    end
  end
end
