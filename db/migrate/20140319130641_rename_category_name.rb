class RenameCategoryName < ActiveRecord::Migration
  def up
	rename_table("category","categories")
  end

  def down
  end
end
