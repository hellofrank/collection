class AddColumnIscommandToArticles < ActiveRecord::Migration
  def change
	add_column :articles, :recommend, :boolean, default: false
  end
end
