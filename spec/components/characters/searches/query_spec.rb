require 'rails_helper'

RSpec.describe Characters::Searches::Query do 
  subject(:query) { described_class.new }

  let!(:flood_db) { Character.flood_database }

  describe "#call" do
    let(:params) do
      {
        species: "human",
        gender: "male",
        house: "Gryffindor",
        eye_colour: "green"
      }
    end

    it "returns result of query" do
      result = query.call(query: params)

      expect(result).to be_a Array
      expect(result.first).to be_a Character
    end
  end
end