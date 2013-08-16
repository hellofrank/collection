# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  about      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  logo       :string(255)
#  category   :string(255)
#  service    :string(255)
#

require 'spec_helper'

describe Company do
 	let(:user) { FactoryGirl.create(:company) }
    it { should respond_to(:owner) }	
	it { should respond_to(:name) }
	it { should respond_to(:about) }
	it { should respond_to(:logo) }
	it { should respond_to(:province) }
	it { should respond_to(:city) }
	it { should respond_to(:district) }
	it { should respond_to(:email) }
	it { should respond_to(:phone) }
	it { should respond_to(:telephone) }
	it { should respond_to(:qq) }
	it { should respond_to(:address_other) }
	it { should respond_to(:contact_other) }
	it { should respond_to(:category) }

end
