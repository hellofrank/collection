class DropChinaCity < ActiveRecord::Migration
  def up
	  drop_table :city
  end

  def down
	  raise ActiveRecord::IrreversibleMigration
  end
end
