# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  about      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  admin_id   :integer
#  logo       :string(255)
#  category   :string(255)
#  service    :string(255)
#  show       :boolean          default(FALSE)
#

class Company < ActiveRecord::Base
  default_scope order: 'created_at desc'
  attr_accessible :logo,:about, :name, :category, :service
  belongs_to :user
  belongs_to :admin
  has_many :projects,  dependent: :destroy
  has_one :contact,  dependent: :destroy
  has_one :address, dependent: :destroy
  has_one :owner,    dependent: :destroy
  has_many :demos, 	   dependent: :destroy
  has_many :doing_result_sets, dependent: :destroy
  mount_uploader :logo, LogoUploader
  default_scope order: 'companies.created_at DESC'
end
