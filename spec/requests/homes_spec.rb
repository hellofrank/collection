require 'spec_helper'

describe "Homes" do
  describe "index page" do
    it "should have the title" do
      visit root_path
      page.should have_selector('title', :text=>'Collections For Building Companies')
    end
  end
end
