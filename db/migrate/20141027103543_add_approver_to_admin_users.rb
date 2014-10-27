class AddApproverToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :approver, :boolean, default: false
  end
end
