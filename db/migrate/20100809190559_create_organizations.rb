class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.string :name_slug
      t.string :contact
      t.string :city
      t.string :city_slug
      t.string :country
      t.text :needs
		
			t.string :password
			t.string :email
			t.string :announcer
						
      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
