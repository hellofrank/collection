# == Schema Information
#
# Table name: demos
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  image        :string(255)
#  introduction :text
#  company_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Demo do
  pending "add some examples to (or delete) #{__FILE__}"
end
