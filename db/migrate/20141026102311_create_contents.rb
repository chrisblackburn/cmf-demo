class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :live_from, default: nil
      t.datetime :live_to, default: nil

      t.timestamps
    end
  end
end
