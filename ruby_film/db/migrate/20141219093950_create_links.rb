class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :user_id
      t.integer :film_id
      t.boolean :status

      t.timestamps
    end
  end
end
