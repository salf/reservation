class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string  :name
      t.integer :person_volume
      t.boolean :active
      t.integer :position

      t.timestamps
    end
  end
end
