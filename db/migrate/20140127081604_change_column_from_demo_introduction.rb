class ChangeColumnFromDemoIntroduction < ActiveRecord::Migration
  def up
		change_column :demos, :introduction, :text
  end

  def down
	  change_column :demos, :introduction, :string
  end
end
