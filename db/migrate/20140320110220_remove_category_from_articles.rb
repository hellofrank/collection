class RemoveCategoryFromArticles < ActiveRecord::Migration
  def up
	remove_column :articles, :category
  end

  def down
  end
end
