class ChangeColumnNamev2 < ActiveRecord::Migration[5.0]
  def change
      rename_column :listingtags, :user_id, :tag_id
  end
end
