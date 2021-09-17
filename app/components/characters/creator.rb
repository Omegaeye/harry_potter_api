module Characters
  class Creator
    include Dry::Monads[:result]
    include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)
    
    def call(params)
      character = Character.create(params)

      return Success(character) if character.save
      Failure(params)
    end
  end
end