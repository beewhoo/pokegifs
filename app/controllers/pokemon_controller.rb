class PokemonController < ApplicationController

    def show

      #poke API
    pokemon_response = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    pokemon_body = JSON.parse(pokemon_response.body)
    pokemon_name  = pokemon_body["name"]
    pokemon_id  = pokemon_body["id"]

    types =   pokemon_body["types"]

    pokemon_type = []
    types.each do |type|
      pokemon_type << type['type']['name']
    end

    #giphy API
    gif_response = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=pikachu&rating=g")
    gif_body = JSON.parse(gif_response.body)
    gif_url = gif_body["data"].sample["url"]

    # render json
    render json: {
      "id": pokemon_id,
      "name": pokemon_name,
      "types": pokemon_type,
      "gif": gif_url
    }

  end

end
