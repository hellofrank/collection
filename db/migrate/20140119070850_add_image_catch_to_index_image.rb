class AddImageCatchToIndexImage < ActiveRecord::Migration
  def change
    add_column :index_images, :image_cache, :string
  end
end
