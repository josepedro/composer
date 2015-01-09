class AddSongurlToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :songurl, :string
  end
end
