class CreateDoingResults < ActiveRecord::Migration
  def change
    create_table :doing_results do |t|
      t.string :image
      t.string :describe
      t.integer :doing_result_set_id

      t.timestamps
    end
  end
end
