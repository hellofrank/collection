# == Schema Information
#
# Table name: demos
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  image        :string(255)
#  introduction :text
#  company_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Demo < ActiveRecord::Base
  default_scopte order: 'created_at desc'
  attr_accessible :company_id, :image, :introduction, :title
  mount_uploader :image, LogoUploader
  belongs_to :company
end
