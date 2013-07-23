class AddDetialsAddressAddContactToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :province, :string
    add_column :companies, :city, :string
    add_column :companies, :district, :string
    add_column :companies, :email, :string
    add_column :companies, :phone, :string
    add_column :companies, :telephone, :string
    add_column :companies, :qq, :string
  end
end
