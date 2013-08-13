# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  telephone  :string(255)
#  mobile     :string(255)
#  mail       :string(255)
#  qq         :string(255)
#  other      :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Contact do
  pending "add some examples to (or delete) #{__FILE__}"
end
