class AddRelationShipsBetweenUsersCabinetsAndFolders < ActiveRecord::Migration
  def change
    add_column :cabinets, :user_id, :integer
    add_column :folders, :cabinet_id, :integer
  end
end
