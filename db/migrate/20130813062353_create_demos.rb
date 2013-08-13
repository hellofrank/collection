class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.string :title
      t.string :image
      t.string :introduction
      t.integer :company_id

      t.timestamps
    end
  end
end
