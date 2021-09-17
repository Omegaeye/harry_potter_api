module Characters
  module Searches
    class Query
      def initialize
        @characters = Character.all
      end

      def call(query:)
        
        characters.where("name LIKE ?", "%#{query[:name]}%")
                  .where("species LIKE ?", "%#{query[:species]}%")
                  .where("gender LIKE ?", "%#{query[:gender]}%")
                  .where("house LIKE ?", "%#{query[:house]}%")
                  .where("year_of_birth LIKE ?", "%#{query[:year_of_birth]}%")
                  .where("ancestry LIKE ?", "%#{query[:ancestry]}%")
                  .where("eye_colour LIKE ?", "%#{query[:eye_colour]}%")
                  .where("hair_colour LIKE ?", "%#{query[:hair_colour]}%")
      end

      private

      attr_reader :characters

    end
  end
end