class Cabinet < ActiveRecord::Base
  has_many :folders
  belongs_to :user
  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, presence: true
  validates :description, length: { minimum: 5 }
  validates :user_id, presence: true
end
