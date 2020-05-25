class Post < ApplicationRecord
  mount_uploader :upload_image, ImageUploader

  validates :title, presence: true
  validates :access_url, presence: true
  validates :description, presence: true
  validates :user_id, presence: true, uniqueness: true

  belongs_to :user
  has_many :post_comments, dependent: :destroy
end
