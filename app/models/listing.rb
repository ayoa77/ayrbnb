class Listing < ApplicationRecord
  belongs_to :user
  has_many :listing_tags
  has_many :tags, through: :listing_tags
  attr_accessible :gallery_id, :name, :image
  # belongs_to :gallery
  mount_uploader :image, ImageUploader
end
