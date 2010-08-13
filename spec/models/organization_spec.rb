require 'spec_helper'

describe Organization do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:responsible) }
  it { should validate_presence_of(:country) }

end

