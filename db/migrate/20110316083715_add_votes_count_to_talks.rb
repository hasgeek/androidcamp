class AddVotesCountToTalks < ActiveRecord::Migration
  def self.up
    add_column :talks, :votes_count, :integer, :default=>0
  end

  def self.down
    remove_column :talks, :votes_count
  end
end
