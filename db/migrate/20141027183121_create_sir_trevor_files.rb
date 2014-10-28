class CreateSirTrevorFiles < ActiveRecord::Migration
  def change
    create_table :sir_trevor_files do |t|
      t.attachment :file
    end
  end
end
