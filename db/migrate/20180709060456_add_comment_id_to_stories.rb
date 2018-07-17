class AddCommentIdToStories < ActiveRecord::Migration[5.1]
  def change
    add_column :stories, :comment_id, :integer
  end
end
