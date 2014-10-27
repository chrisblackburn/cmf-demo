class CreateSirTrevorImages < ActiveRecord::Migration
  def change
    create_table :sir_trevor_images do |t|
      t.attachment :image
    end
  end
end
