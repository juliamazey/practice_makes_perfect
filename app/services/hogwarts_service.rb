class HogwartsService

  def initialize(house)
    @house = house
  end

  def get_house
    parsed_json = JSON.parse(response.body, symbolize_names: true)
    parsed_json.find do |house|
      house[:name] == @house
    end
  end

  def get_students(house_id = nil)
    JSON.parse(response(house_id).body, symbolize_names: true)
  end

  def response(house_id = nil)
    if house_id.nil?
      conn.get("/api/v1/house")
    else
      conn.get("/api/v1/house/#{house_id}")
    end
  end

  def conn
    Faraday.new(url: "http://hogwarts-as-a-service.herokuapp.com") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers['x_api_key'] = ENV['API_KEY']
    end
  end
end
