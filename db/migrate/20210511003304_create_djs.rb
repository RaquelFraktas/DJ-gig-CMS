class CreateDjs < ActiveRecord::Migration
  def change
    create_table :djs do |t|

      t.timestamps null: false
    end
  end
end
