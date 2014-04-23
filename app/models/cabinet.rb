class Cabinet < ActiveRecord::Base
  has_many :folders
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
