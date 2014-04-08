# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  keywords    :string(255)
#  coverimage  :string(255)
#  category_id :integer
#  recommend   :boolean          default(FALSE)
#

require 'spec_helper'

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"
end
