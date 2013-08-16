class RemovePartFieldFromCompanies < ActiveRecord::Migration
  def up
    remove_column :companies, :owner
    remove_column :companies, :province
    remove_column :companies, :city
    remove_column :companies, :district
    remove_column :companies, :email
    remove_column :companies, :phone
    remove_column :companies, :telephone
    remove_column :companies, :qq
    remove_column :companies, :address_other
    remove_column :companies, :contact_other
  end

  def down
    add_column :companies, :contact_other, :string
    add_column :companies, :address_other, :string
    add_column :companies, :qq, :string
    add_column :companies, :telephone, :string
    add_column :companies, :phone, :string
    add_column :companies, :email, :string
    add_column :companies, :district, :string
    add_column :companies, :city, :string
    add_column :companies, :province, :string
    add_column :companies, :owner, :string
  end
end
