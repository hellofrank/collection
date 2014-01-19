class RemoveColumnFromAddress < ActiveRecord::Migration
  def up
	  remove_column :addresses, :province_id, :city_id, :district_id
  end

  def down
	  add_column :addresses, :province_id,:integer, :city_id, :integer, :district_id, :integer
  end
end
