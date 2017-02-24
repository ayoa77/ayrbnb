class ChangeTableNameListingtagsListingTags < ActiveRecord::Migration[5.0]
  def change
    rename_table :listingtags, :listing_tags
  end
end
