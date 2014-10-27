class AddApprovedAtToContents < ActiveRecord::Migration
  def change
    add_column :contents, :approved_at, :datetime, default: nil
  end
end
