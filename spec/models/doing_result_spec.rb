# == Schema Information
#
# Table name: doing_results
#
#  id                  :integer          not null, primary key
#  image               :string(255)
#  describe            :string(255)
#  doing_result_set_id :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'spec_helper'

describe DoingResult do
  pending "add some examples to (or delete) #{__FILE__}"
end
