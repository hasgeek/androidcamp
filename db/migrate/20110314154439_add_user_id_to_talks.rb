class AddUserIdToTalks < ActiveRecord::Migration
  def self.up
    add_column :talks, :user_id, :integer
  end

  def self.down
    remove_column :talks, :user_id
  end
end
