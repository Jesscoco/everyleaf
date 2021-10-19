class User < ApplicationRecord
    validates :name, presence: true, length: { minimum: 4, maximum: 30 }
    validates :email, presence: true, length: { minimum: 5, maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
    before_validation { email.downcase! }
    has_secure_password
    validates :password, length: { minimum:6 }
    has_many :tasks, dependent: :destroy
end
