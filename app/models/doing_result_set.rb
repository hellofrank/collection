# == Schema Information
#
# Table name: doing_result_sets
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  describe   :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DoingResultSet < ActiveRecord::Base
  attr_accessible :company_id, :describe, :title
  belongs_to :company
  has_many :doing_results,dependent: :destroy

end
