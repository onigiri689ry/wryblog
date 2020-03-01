class Image < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :blog, optional: true

  validates :image_url,               presence: true
end
