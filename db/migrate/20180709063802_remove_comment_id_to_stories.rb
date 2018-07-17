class RemoveCommentIdToStories < ActiveRecord::Migration[5.1]
  def change
    remove_column :stories, :comment_id, :integer
  end
end
