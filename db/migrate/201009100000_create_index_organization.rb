class CreateIndexOrganization < ActiveRecord::Migration
  def self.up
    add_index :organizations, :id
  end

  def self.down
    drop_table :organizations
  end
end
