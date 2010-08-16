class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
    
   	Tag.new(:name => "food").save
   	Tag.new(:name => "clothes").save
   	Tag.new(:name => "volunteer_work").save
   	Tag.new(:name => "money").save
   	Tag.new(:name => "others").save
   	
  end

  def self.down
    drop_table :tags
  end
end
