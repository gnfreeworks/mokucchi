class Post < ApplicationRecord
  mount_uploader :upload_image, ImageUploader

  validates :title, :access_url, :description, presence: true

  belongs_to :user
  has_many :post_comments, dependent: :destroy
end
