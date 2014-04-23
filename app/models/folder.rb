class Folder < ActiveRecord::Base
  belongs_to :cabinet
  validates :name, presence: true
  validates :description, presence: true
  validates :cabinet_id, presence: true
end
