# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  province   :string(255)
#  city       :string(255)
#  district   :string(255)
#  street     :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Address < ActiveRecord::Base
  attr_accessible :city, :company_id, :district, :province, :street,:province_id,:city_id,:district_id
  belongs_to :company
end
