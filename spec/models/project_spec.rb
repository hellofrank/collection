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

require 'spec_helper'

describe Project do
  pending "add some examples to (or delete) #{__FILE__}"
end
