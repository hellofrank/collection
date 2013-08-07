#encoding: utf-8
require 'spec_helper'

describe "UserPages" do
 describe "sign_up" do

  subject { page }
  before { visit new_user_registration_path}
  let(:submit) {"注册"}
  let(:user) { FactoryGirl.create(:user) }

  describe "has filed" do
     
	 it { has_field?("用户名")}
     it "accepts user name" do
     	fill_in "用户名", with: user.name
     end

     it { has_field?("邮箱") }
	 it "accepts user email" do
	 	fill_in "邮箱", with: user.email
	 end

	 it { has_field?("密码") }
	 it "accepts user password" do
		 fill_in "密码", with: user.password
	 end

	 it { has_field?("密码确认") }
	 it "accepts user password_confirmation"do
		 fill_in "密码确认", with: user.password_confirmation
	 end

  end

  describe "with invalid information" do
      it "should not create user" do
          expect {click_button submit}.not_to change(User, :count)
      end
  end

  describe "with valid information" do
     
	before do
      fill_in "用户名",         with: "frank" 
      fill_in "邮箱",        	with: "frank@frank.com"
      fill_in "密码",           with: "12345678"
      fill_in "密码确认",       with: "12345678"
    end
    it "should create user" do
        expect {click_button submit}.to change(User, :count).by(1)
    end
  end

end


describe "user show page" do
  subject { page }
  before { visit new_user_session_path }
  describe "profile page" do
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

    before { visit user_path(@user) }
    it { should have_link('添加工程', href: new_company_project_path(@user.company.id))}
  end
end
end
