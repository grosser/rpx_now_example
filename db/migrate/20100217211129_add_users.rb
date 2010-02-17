class AddUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null=>false
      t.string :identifier, :null=>false
      t.string :email
      t.timestamps
    end

    add_index :users, :identifier, :unique => true
  end

  def self.down
    drop_table :users
  end
end