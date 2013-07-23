class AddOtherAddressAndContactToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :address_other, :string
    add_column :companies, :contact_other, :string
  end
end
