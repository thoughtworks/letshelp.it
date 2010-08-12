class CreateOrganizationTagJoinTable < ActiveRecord::Migration
  def self.up
    create_table :organizations_tags, :id => false do |t|
      t.integer :organization_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :organizations_tags
  end
end