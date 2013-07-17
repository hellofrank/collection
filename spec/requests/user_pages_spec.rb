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
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('h4', text: user.name)}
    it { should have_selector('h4', text: user.email)}
    it { should have_link('创建公司', href: new_user_company_path(user))}
  end
end
end
