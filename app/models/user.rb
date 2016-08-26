class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  before_save do
    self.email.downcase!
  end
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :first_name, :last_name, length: {in: 2..45}
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  # validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :password, length: {minimum: 8}
  has_many :groups, dependent: :destroy
  has_many :members, dependent: :destroy
  has_many :groups_member, through: :members, source: :group
end
