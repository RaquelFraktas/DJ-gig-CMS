class CreatePromoters < ActiveRecord::Migration[5.2]
  def change
    create_table :promoters do |t|
      t.string :name
      t.string :based_in
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
