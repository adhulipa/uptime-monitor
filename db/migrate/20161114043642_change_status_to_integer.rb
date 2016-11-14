class ChangeStatusToInteger < ActiveRecord::Migration[5.0]
  def change
  	change_column :websites, :status, :integer, :using => 'case when c then 1 else 2 end'
  end
end
