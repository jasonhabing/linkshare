class AddVotingToLinks < ActiveRecord::Migration
  def change

add_column :links, :up_votes, :integer, :null => false, :default => 0
add_column :links, :down_votes, :integer, :null => false, :default => 0

  end
end
