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

class DoingResult < ActiveRecord::Base
  default_scope order: 'created_at desc'
  attr_accessible :describe, :doing_result_set_id, :image
  belongs_to :doing_result_set
  mount_uploader :image, ResultImageUploader
end
