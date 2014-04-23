class Folder < ActiveRecord::Base
  belongs_to :cabinet
  validates :name, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, presence: true
  validates :description, length: { minimum: 5 }
  validates :cabinet_id, presence: true
end
