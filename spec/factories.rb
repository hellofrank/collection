#encoding: utf-8
#require 'carrierwave/test/matchers'
include ActionDispatch::TestProcess

FactoryGirl.define do
	#user model
	factory :user do
		name "zhjhhx07"
		email "zhjhhx07@sina.com"
		password "12345678"
		password_confirmation "12345678"
	end
	
	#company model
	factory :company do
		logo {fixture_file_upload(Rails.root.join('spec', 'images', 'banner.png'), 'image/png')}
		#logo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'images','banner.png'))}
		name "聚意汇鑫"
		owner "小吴"
		about "聚意汇鑫"
		province "北京"
		city "北京"
		district "朝阳区"
		email "juyihuixin@126.com"
		phone "13855667788"
		telephone "87562563"
		qq "125489"
		address_other "星光大道5号"
		contact_other "传真：56589875"
		category "装潢"

	end

end
