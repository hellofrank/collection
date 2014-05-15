# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  content    :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  money      :string(255)
#  kind       :string(255)
#

class Project < ActiveRecord::Base
  default_scope order: 'created_at desc'
  attr_accessible :content, :name
  belongs_to  :company
end
