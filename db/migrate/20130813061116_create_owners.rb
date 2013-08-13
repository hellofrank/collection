class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.string :name
      t.string :photo
      t.string :about
      t.string :license
      t.integer :company_id

      t.timestamps
    end
  end
end
