# == Schema Information
#
# Table name: index_images
#
#  id         :integer          not null, primary key
#  image      :string(255)
#  describe   :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class IndexImage < ActiveRecord::Base
  default_scope order: 'created_at desc'
  attr_accessible :describe, :image, :url
  mount_uploader :image, IndexImageUploader
end
