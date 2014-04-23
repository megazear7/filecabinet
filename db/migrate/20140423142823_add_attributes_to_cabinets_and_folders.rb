class AddAttributesToCabinetsAndFolders < ActiveRecord::Migration
  def change
    add_column :cabinets, :name, :string
    add_column :cabinets, :description, :text
    add_column :folders, :name, :string
    add_column :folders, :description, :text
  end
end
