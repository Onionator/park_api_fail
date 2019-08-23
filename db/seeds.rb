class Seed
  # To protect my api key and still use this information for the project, the project will not be capable of seeding again without a new api key. If you would like an to use the project then pull the info from the dumped database or get your own api key from https://developer.nps.gov/api/ and put your key in the url.
  def self.begin
    Park.destroy_all
    seed = Seed.new

    response = RestClient::Request.execute(
      method: :get,
      url: 'https://developer.nps.gov/api/v1/parks?api_key=[API_KEY]'
    )

    park_info = JSON.parse(response)
    seed.generate_parks(park_info)
  end
  def generate_parks(park_info)
    count = 0
    number = 50
    total = (park_info["total"].to_i)
    number = count - total if count - total < number
    # while count < total do
      number.times do |i|
        park = Park.create!(
          description: park_info["data"][i]["description"],
          directions: park_info["data"][i]["directionsInfo"],
          name: park_info["data"][i]["fullname"] || park_info["data"][i]["name"],
          states: park_info["data"][i]["states"],
          website: park_info["data"][i]["url"]
        )
        count += 1
        puts "Park #{i}: #{park.name}"
      end
    # end
  end
end

Seed.begin
