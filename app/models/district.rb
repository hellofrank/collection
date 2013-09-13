# encoding: utf-8
# == Schema Information
#
# Table name: districts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city_id    :integer
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class District < ActiveRecord::Base
	
  attr_accessible :name, :city_id, :name_en, :name_abbr
  
	belongs_to :city

	scope :with_city, ->(city) { where(city_id: city) }

	def province
		city.province
	end

	def short_name
		@short_name ||= name.gsub(/区|县|市|自治县/, '')
	end
	
	def siblings
		@siblings ||= scoped.with_city(self.city_id)
	end
	
end
