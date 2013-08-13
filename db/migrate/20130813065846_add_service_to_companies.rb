class AddServiceToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :service, :string
  end
end
