class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :recoverable, :confirmable, :validatable

  # Associations
  has_many :posts, dependent: :destroy

  # Validations handled by Devise
end