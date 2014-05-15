# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  keywords    :string(255)
#  coverimage  :string(255)
#  category_id :integer
#  recommend   :boolean          default(FALSE)
#

class Article < ActiveRecord::Base

  default_scope order: 'created_at desc'

  attr_accessible :admin_id,:category_id, :content, :title, :keywords, :coverimage
  mount_uploader :coverimage, LogoUploader
  #belongs_to :admin
  belongs_to :category
  #has_one :category
  has_many :comments
end
