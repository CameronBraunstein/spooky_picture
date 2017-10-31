class CreateSpookers < ActiveRecord::Migration[5.1]
  def change
    create_table :spookers do |t|
      t.string :name
      t.string :picture

      t.timestamps
    end
  end
end
