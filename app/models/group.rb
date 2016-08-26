class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :active_members, through: :members, source: :user
  validates :name, :description, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { minimum: 10 }
end
