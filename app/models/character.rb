class Character < ApplicationRecord
  validates :name, presence: true

  def self.flood_database
    records = JSON.parse(Characters::HarryPotterApiService.get_data.body, symbolize_names: true)
    
    records.map do |record|
      params = { 
        name: record[:name],
        species: record[:species],
        gender: record[:gender],
        house: record[:house],
        date_of_birth: record[:dateOfBirth],
        year_of_birth: record[:yearOfBirth],
        ancestry: record[:ancestry],
        eye_colour: record[:eyeColour],
        hair_colour: record[:hairColour],
        patronus: record[:patronus],
        hogwarts_student: record[:hogwartsStudent],
        hogwarts_staff: record[:hogwartsStaff],
        actor: record[:actor],
        alive: record[:alive],
        image: record[:image]
       }

       Characters::Creator.new.call(params)
    end
  end
end
