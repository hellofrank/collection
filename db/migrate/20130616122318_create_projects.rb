class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :content
      t.integer :company_id

      t.timestamps
    end
  end
end
