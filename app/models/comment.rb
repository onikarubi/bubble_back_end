class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :comment_content, presence: true
  mount_uploader :image, ImageUploader
end
