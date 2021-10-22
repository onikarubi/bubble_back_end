class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :books, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy

  def already_favorites?(book)
    self.favorites.exists?(book_id: book.id)
  end
end
