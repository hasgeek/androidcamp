class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :talk_id
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
