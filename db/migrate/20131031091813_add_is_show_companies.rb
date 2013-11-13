class AddIsShowCompanies < ActiveRecord::Migration
	def change
		add_column :companies, :show, :boolean, default: false
	end
end
