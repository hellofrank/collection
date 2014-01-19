class DropChinaDistrict < ActiveRecord::Migration
  def up
	  drop_table :district
  end

  def down
	  raise ActiveRecord::IrreversibleMigration
  end
end
