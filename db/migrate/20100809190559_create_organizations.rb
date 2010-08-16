class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.string :_name
      t.string :contact
      t.string :city
      t.string :_city
      t.string :country
      t.text :needs
		
			t.string :password
			t.email :email
			t.announcer :announcer
						
      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
