#encoding: utf-8
require 'spec_helper'

describe "Homes" do
  
  subject { page }

  before {visit new_user_session_path }

  describe "index page title" do
	before(:each) do
		@user = FactoryGirl.create(:user)
		@user.confirmed_at = Time.now
		@user.save
	end
    before do
    	fill_in "邮箱",    with: @user.email 
    	fill_in "密码",    with: @user.password
    	click_button "登录"
  	end
    it { should have_selector('title', text: 'Collections For Building Companies')}
    it { should have_link('退出', href: destroy_user_session_path)}
	it { should have_link('编辑', href: edit_user_registration_path ) }
	it { should have_link(@user.name, href: user_path(@user)) }
  end
  

end

