require 'spec_helper'

describe Organization do
  before(:each) do
    @organization = Factory :organization
  end

  it {should have_and_belong_to_many :tags}

  it {should validate_presence_of :name}
  it {should validate_presence_of :contact}
  it {should validate_presence_of :city}
  it {should validate_presence_of :country}
  it {should validate_presence_of :password}
  it {should validate_presence_of :email}
  it {should validate_presence_of :announcer}

  it {should validate_uniqueness_of :name}

  context 'slugs' do
    it 'should have appropriate slugs' do
      @organization.city_slug.should == Organization.slug_city(@organization.city)
      @organization.name_slug.should == Organization.slug_name(@organization.name)
    end

    it 'should create slugs automatically' do
      @organization.city = "Jaraguá do Sul"
      @organization.city_slug.should == "jaragua do sul"
    end
  end

  context 'randomness' do
    it 'should retrieve a random number of organizations' do
      number = rand(10)
      (number*2).times {Factory :organization }

      Organization.get_random_list(number).count.should == number
    end
  end
end

