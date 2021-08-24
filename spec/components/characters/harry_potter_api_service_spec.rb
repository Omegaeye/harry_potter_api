require 'rails_helper'

RSpec.describe Characters::HarryPotterApiService do
  describe "HarryPotterApiService::get_data" do
    subject(:service) { described_class}
    
    it "returns successful response" do
      response = subject.get_data

      expect(response.env[:status]).to eq(200)
    end
  end
end