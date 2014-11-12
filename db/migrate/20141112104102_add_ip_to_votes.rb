class AddIpToVotes < ActiveRecord::Migration
  def change
  	add_column :votes, :ip_address, :string # these arguements are for te table, column name, type of data
  end
end
