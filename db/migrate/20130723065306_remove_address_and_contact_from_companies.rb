class RemoveAddressAndContactFromCompanies < ActiveRecord::Migration
  def up
    remove_column :companies, :address
    remove_column :companies, :contact
  end

  def down
    add_column :companies, :contact, :string
    add_column :companies, :address, :string
  end
end
