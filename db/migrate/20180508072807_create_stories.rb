class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.integer      :category_id
      t.text         :text
      t.timestamps
    end
  end
end
