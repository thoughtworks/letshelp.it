require 'spec_helper'

describe Tag do
  before(:each) do
    @tag = Factory :tag
  end
  it {should validate_presence_of :name}
  it {should validate_uniqueness_of :name}
end

