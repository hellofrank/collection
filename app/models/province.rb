# encoding: utf-8
# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  name_en    :string(255)
#  name_abbr  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Province < ActiveRecord::Base

  attr_accessible :id,:name, :name_en, :name_abbr
  has_many :cities, dependent: :destroy
  has_many :districts, through: :cities

end
