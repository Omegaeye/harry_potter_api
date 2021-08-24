require 'rails_helper'

RSpec.describe Api::V1::Characters::SearchController do
  let(:expected_result) { {
    "name": "Harry Potter",
    "species": "human",
    "gender": "male",
    "house": "Gryffindor",
    "dateOfBirth": "31-07-1980",
    "yearOfBirth": 1980,
    "ancestry": "half-blood",
    "eyeColour": "green",
    "hairColour": "black",
    "wand": {
      "wood": "holly",
      "core": "phoenix feather",
      "length": 11
    },
    "patronus": "stag",
    "hogwartsStudent": true,
    "hogwartsStaff": false,
    "actor": "Daniel Radcliffe",
    "alive": true,
    "image": "http://hp-api.herokuapp.com/images/harry.jpg"
    } }
  before do
    get api_v1_characters_search_index_path
  end

  it "response with status of :ok" do
    expect(response).to have_http_status(:ok)
  end

  it "returns valid key attributes" do
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data].keys).to eq(expected_result.keys)
  end
  
end