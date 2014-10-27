class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :slug
      t.text :content
      t.datetime :live_from
      t.datetime :live_to

      t.timestamps
    end
  end
end
