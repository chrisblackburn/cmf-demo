class CreateApproverUser < ActiveRecord::Migration
  def change
    AdminUser.create!(email: 'approver@example.com', password: 'password', password_confirmation: 'password', approver: true)
  end
end
