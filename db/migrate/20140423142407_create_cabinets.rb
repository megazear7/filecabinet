class CreateCabinets < ActiveRecord::Migration
  def change
    create_table :cabinets do |t|

      t.timestamps
    end
  end
end
