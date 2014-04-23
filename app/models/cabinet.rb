class Cabinet < ActiveRecord::Base
  has_many :folders
  belongs_to :user
end
