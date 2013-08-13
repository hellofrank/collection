# == Schema Information
#
# Table name: owners
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  about      :string(255)
#  license    :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Owner do
  pending "add some examples to (or delete) #{__FILE__}"
end
