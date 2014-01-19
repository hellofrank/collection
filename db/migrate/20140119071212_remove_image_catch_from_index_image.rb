class RemoveImageCatchFromIndexImage < ActiveRecord::Migration
  def up
    remove_column :index_images, :image_cache
  end

  def down
    add_column :index_images, :image_cache, :string
  end
end
