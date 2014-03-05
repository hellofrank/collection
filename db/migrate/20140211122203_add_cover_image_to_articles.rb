class AddCoverImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :coverimage, :string
  end
end
