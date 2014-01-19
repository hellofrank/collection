# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  province   :string(255)
#  city       :string(255)
#  district   :string(255)
#  street     :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Address do
  pending "add some examples to (or delete) #{__FILE__}"
end
