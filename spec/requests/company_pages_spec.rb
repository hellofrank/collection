#encoding: utf-8
require 'spec_helper'

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
		describe "new company page should have filed" do
			it{ should have_selector('h1', text: 'Create company')}
			it{ has_field? "logo" }
			it{ has_field? "公司名" }
			it{ has_field? "法人" }
			it{ has_field? "关于" }
			it{ has_field? "联系方式" }
			it{ has_field? "地址" }
			it{ has_field? "创建" }
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
		before { visit new_user_company_path(@user) }
		it { response.not_should be_success }
	end
end
