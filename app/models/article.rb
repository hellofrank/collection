# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string(255)
#  keywords   :string(255)
#

class Article < ActiveRecord::Base
  attr_accessible :admin_id,:category_id, :content, :title, :keywords, :coverimage
  mount_uploader :coverimage, LogoUploader
  #belongs_to :admin
  belongs_to :category
  #has_one :category
  has_many :comments
end
