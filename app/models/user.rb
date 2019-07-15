class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	         :recoverable, :rememberable, :validatable

	has_many :products
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :orders
	has_many :banks

	attachment :profile_image

	# validates :name, presence: true
	# validates :real_name, presence: true
	# validates :profile, presence: true


end
