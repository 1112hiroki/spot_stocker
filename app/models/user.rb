class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 160 }
  validates :sex, presence: true
  enum sex: { 男: 0, 女: 1 }
  validates :age, presence: true
  enum age: { １０代: 1, ２０代: 2, ３０代: 3, ４０代: 4, ５０代以上: 5 }
  mount_uploader :image, ImgNameUploader
end
