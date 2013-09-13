# encoding: utf-8
# == Schema Information
#
# Table name: cities
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  province_id :integer
#  level       :integer
#  zip_code    :string(255)
#  name_en     :string(255)
#  name_abbr   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#


class City < ActiveRecord::Base
  
  attr_accessible :name, :province_id, :level, :zip_code, :name_en, :name_abbr
  
  belongs_to :province
  has_many :districts, dependent: :destroy

  scope :with_province, ->(province) { where(province_id: province) }

  def short_name
    @short_name ||= name.gsub(/市|自治州|地区|特别行政区/, '')
  end

  def siblings
    @siblings ||= scoped.with_province(self.province_id)
  end

end
