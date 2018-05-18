class AddLikesCountToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :likes_count, :integer
  end
end
