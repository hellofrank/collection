class DropChinaRegions < ActiveRecord::Migration
  def up
	  drop_table :province
  end

  def down
	  raise ActiveRecord::IrreversibleMigration
  end
end
