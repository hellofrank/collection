class ChangeColumnFromCompanyUserToAdmin < ActiveRecord::Migration
  def up
	  rename_column :companies, :user_id, :admin_id
  end

  def down
	  rename_column :companies, :admin_id, :user_id
  end
end
