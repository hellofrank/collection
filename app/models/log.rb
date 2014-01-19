# == Schema Information
#
# Table name: logs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  house_size :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Log < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :house_size, :title, :user_id
end
