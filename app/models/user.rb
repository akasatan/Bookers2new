class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  attachment :my_image

  validates :name, length: { minimum: 2, maximum: 20 }
  validates :setsumei, length: { maximum: 50 }

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

end
