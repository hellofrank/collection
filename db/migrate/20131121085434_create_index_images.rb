class CreateIndexImages < ActiveRecord::Migration
  def change
    create_table :index_images do |t|
      t.string :image
      t.string :describe
      t.string :url

      t.timestamps
    end
  end
end
