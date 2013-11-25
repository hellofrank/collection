class IndexImage < ActiveRecord::Base
  attr_accessible :describe, :image, :url
  mount_uploader :image, LogoUploader
end
