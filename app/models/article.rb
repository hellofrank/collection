# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  admin_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string(255)
#

class Article < ActiveRecord::Base
  attr_accessible :admin_id, :content, :title, :category
  #belongs_to :admin
end
