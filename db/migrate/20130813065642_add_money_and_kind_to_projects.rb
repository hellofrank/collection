class AddMoneyAndKindToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :money, :string
    add_column :projects, :kind, :string
  end
end
