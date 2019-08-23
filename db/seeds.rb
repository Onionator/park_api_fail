class Seed
  def self.begin
    Park.destroy_all
    seed = Seed.new

    response = RestClient::Request.execute(
      method: :get,
      url: 'https://developer.nps.gov/api/v1/parks',
      params: { api_key: 'cPa0EX5nSyuioSnuoRazpgmocWfn0jLq8CzOg6Gl' }
    )

    park_info = JSON.parse(response)
    byebug
    # seed.generate_parks(park_info)
  end
  # def generate_parks(park_info)
  #   park_info["total"].times do |i|
  #     park = Park.create!(
  #       park: park_info["data"]["fullname"],
  #       city: Faker::Games::Pokemon.location,
  #       country: Faker::Address.country
  #     )
  #     puts "Destination #{i}: City is #{park.city} and country is
  #   end
  # end
end

Seed.begin
