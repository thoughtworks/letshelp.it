# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

   	Tag.new(:name => "food").save
   	Tag.new(:name => "clothes").save
   	Tag.new(:name => "volunteer_work").save
   	Tag.new(:name => "money").save
   	Tag.new(:name => "others").save
