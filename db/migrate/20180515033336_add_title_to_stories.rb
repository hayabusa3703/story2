class AddTitleToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :title, :string
  end
end
