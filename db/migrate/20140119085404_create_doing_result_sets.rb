class CreateDoingResultSets < ActiveRecord::Migration
  def change
    create_table :doing_result_sets do |t|
      t.string :title
      t.string :describe
      t.integer :company_id

      t.timestamps
    end
  end
end
