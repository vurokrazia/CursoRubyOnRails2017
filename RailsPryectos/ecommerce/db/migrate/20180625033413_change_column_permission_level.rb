class ChangeColumnPermissionLevel < ActiveRecord::Migration[5.1]
  def change
  	#change_column_default :users, :permission_level, from: nil, to: 0
  end
end
