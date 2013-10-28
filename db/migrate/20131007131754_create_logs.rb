class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :house_size

      t.timestamps
    end
  end
end
