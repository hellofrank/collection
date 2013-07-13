class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :owner
      t.string :name
      t.string :about
      t.string :address
      t.string :contact

      t.timestamps
    end
  end
end
