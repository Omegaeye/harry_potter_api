module Characters
  class HarryPotterApiService
    
    def self.get_data
      response = conn.get("/api/characters")
    end

    private

    def self.conn
      Faraday.new("http://hp-api.herokuapp.com")
    end
  end
end