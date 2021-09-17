require 'rails_helper'

RSpec.describe Character do
  
  describe "#validations" do
    it { should validate_presence_of(:name) } 
  end
end