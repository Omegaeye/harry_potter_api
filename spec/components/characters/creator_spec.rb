require 'rails_helper'

RSpec.describe Characters::Creator do
  subject(:creator) { described_class.new }

  describe "#call" do
    let(:params) do
      {
        name: "Harry Potter",
        species: "human",
        gender: "male",
        house: "Gryffindor",
        date_of_birth: "31-07-1980",
        year_of_birth: 1980,
        ancestry: "half-blood",
        eye_colour: "green",
        hair_colour: "black",
        patronus: "stag",
        hogwarts_student: true,
        hogwarts_staff: false,
        actor: "Daniel Radcliffe",
        alive: true,
        image: "http://hp-api.herokuapp.com/images/harry.jpg"
      }
    end
    let(:bad_params) { { species: "human", gender: "male" } }
    let(:success) { Dry::Monads::Success }
    let(:failure) { Dry::Monads::Failure }
    
    it "returns success" do
      expect(creator.call(params)).to be_a(success)
    end

    context "with bad params" do
      it "returns failure" do
        expect(creator.call(bad_params)).to be_a(failure)
      end
    end
  end
end