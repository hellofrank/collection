class RemoveAdminIdFromArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :admin_id
  end

  def down
    add_column :articles, :admin_id, :integer
  end
end
