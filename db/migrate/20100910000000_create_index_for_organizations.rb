class CreateIndexForOrganizations < ActiveRecord::Migration
  def self.up
    add_index :organizations, :id
  end

  def self.down
    remove_index :organizations, :id
  end
end
