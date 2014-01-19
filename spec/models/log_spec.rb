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

require 'spec_helper'

describe Log do
  pending "add some examples to (or delete) #{__FILE__}"
end
