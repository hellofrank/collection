# == Schema Information
#
# Table name: demos
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  image        :string(255)
#  introduction :string(255)
#  company_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Demo < ActiveRecord::Base
  attr_accessible :company_id, :image, :introduction, :title
  mount_uploader :image, LogoUploader
  belongs_to :company
end
