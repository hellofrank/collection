# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  owner      :string(255)
#  name       :string(255)
#  about      :string(255)
#  address    :string(255)
#  contact    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :logo,:about, :address, :contact, :name, :owner
  belongs_to :user
  belongs_to :admin
  has_many :projects, dependent: :destroy
  mount_uploader :logo, LogoUploader
  default_scope order: 'companies.created_at DESC'
end
