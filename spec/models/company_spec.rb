# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  owner         :string(255)
#  name          :string(255)
#  about         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#  logo          :string(255)
#  province      :string(255)
#  city          :string(255)
#  district      :string(255)
#  email         :string(255)
#  phone         :string(255)
#  telephone     :string(255)
#  qq            :string(255)
#  address_other :string(255)
#  contact_other :string(255)
#  category      :string(255)
#

require 'spec_helper'

describe Company do
  pending "add some examples to (or delete) #{__FILE__}"
end
