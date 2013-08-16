# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  about      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  logo       :string(255)
#  category   :string(255)
#  service    :string(255)
#

class Company < ActiveRecord::Base
  attr_accessible :logo,:about, :name, :category, :service
  belongs_to :user
  belongs_to :admin
  has_many :projects,  dependent: :destroy
  has_many :contacts,  dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :owners,    dependent: :destroy
  has_many :demos, 	   dependent: :destroy
  mount_uploader :logo, LogoUploader
  default_scope order: 'companies.created_at DESC'
end
