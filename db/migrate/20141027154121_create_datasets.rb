class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :discloser_name
      t.integer :disclosure_score
      t.string :gics_sector
      t.string :gics_industry_group
      t.string :gics_industry
      t.string :gics_sub_industry

      t.timestamps
    end
  end
end
