#encoding: utf-8
require 'spec_helper'
#require 'carrierwave/test/matchers'
describe " User Signed CompanyPages" do
	subject { page }
	before { visit new_user_session_path }

	describe "new company page" do
		
		before(:each) do
			@user = FactoryGirl.create(:user)
			@user.confirmed_at = Time.now
			@user.save
		end

		before do
			fill_in "邮箱", with: @user.email
			fill_in "密码", with: @user.password
			click_button "登录"
		end
		
		before { visit new_user_company_path(@user) }
	
		let(:submit) {"创建"}
		let(:company) {FactoryGirl.create(:company)}

		describe "new company page should have filed" do
			it{ should have_selector('h1', text: '创建公司')}
			it{ has_field? "Logo" }
			it{ has_field? "公司名称" }
			it{ has_field? "法人" }
			it{ has_field? "省"}
			it{ has_field? "市"}
			it{ has_field? "区"}
			it{ has_field? "街"}
			it{ has_field? "邮箱"}
			it{ has_field? "手机"}
			it{ has_field? "座机"}
			it{ has_field? "QQ"}
			it{ has_field? "类别"}
			it{ has_field? "关于" }
			it{ has_field? "创建" }
		end

		it "access company name" do
			fill_in "公司名称", with: company.name
		end

		describe "add a company item" do
			include CarrierWave::Test::Matchers
			before do
				fill_in "Logo", 	with: company.logo
				fill_in "公司名称", with: company.name
				fill_ih "法人",     with: company.owner
				fill_in "省",		with: company.province
				fill_in "市",		with: company.city
				fill_in "区", 		with: company.district
				fill_in "街道",		with: company.address_other
				fill_in "邮箱", 	with: company.email
				fill_in "手机",		with: company.telephone
				fill_in "QQ",		with: company.qq
				fill_in "其他",		with: company.contact_other
				fill_in "类别",		with: company.category
				fill_in "关于",		with: company.about
			end

			it "should create a company" do
				expect { click_button submit }.to change(Company, :count).by(1)
			end

		end

	end
end

describe "User not signed in visit create new company" do
	subject { page }
	before(:each) do
		@user = FactoryGirl.create(:user)
		@user.confirmed_at = Time.now
		@user.save
	end
	describe "should not visit new company page" do
		before { get new_user_company_path(@user) }
		specify { expect(response).to redirect_to(root_path)}
	end
end
