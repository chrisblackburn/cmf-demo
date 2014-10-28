class CreateContentTranslations < ActiveRecord::Migration
  def up
    Content.create_translation_table! content: :text
  end

  def down
    Content.drop_translation_table!
  end
end
