module Api
  module V1
    module Characters
      class SearchController < ApplicationController

        def index
          json = { 
            data: {
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
            } 
          }

          render json: json
        end
      end
    end
  end
end
