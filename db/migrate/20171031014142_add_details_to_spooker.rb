class AddDetailsToSpooker < ActiveRecord::Migration[5.1]
  def change
    add_column :spookers, :darkness, :boolean
    add_column :spookers, :movie, :string
    add_column :spookers, :story, :string
    add_column :spookers, :month, :string
  end
end
