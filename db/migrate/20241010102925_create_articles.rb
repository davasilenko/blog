class CreateArticles < ActiveRecord::Migration[7.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :brief_description
      t.text :full_content

      t.timestamps
    end
  end
end
