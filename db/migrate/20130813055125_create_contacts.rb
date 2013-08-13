class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :telephone
      t.string :mobile
      t.string :mail
      t.string :qq
      t.string :other
      t.integer :company_id

      t.timestamps
    end
  end
end
