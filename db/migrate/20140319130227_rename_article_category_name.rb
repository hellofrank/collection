class RenameArticleCategoryName < ActiveRecord::Migration
  def up
	rename_table("article_categories","category")
  end

  def down
  end
end
