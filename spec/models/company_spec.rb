# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  owner      :string(255)
#  name       :string(255)
#  about      :string(255)
#  address    :string(255)
#  contact    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Company do
  pending "add some examples to (or delete) #{__FILE__}"
end
