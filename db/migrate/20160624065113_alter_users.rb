class AlterUsers < ActiveRecord::Migration
  def up
    change_column("users", "name", :string, :limit => 50, :null => false)
    change_column("users", "email", :string, :limit => 100, :null =>false)
    puts "*** Adding index ***"
    add_index("users", "email", :unique => true)
  end

  def down
    remove_index("users", "email")
    change_column("users", "email", :string)
    change_column("users", "name", :string)
  end
end
