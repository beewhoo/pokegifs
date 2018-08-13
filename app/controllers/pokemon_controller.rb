class PokemonController < ApplicationController

  def index
    key = 'iEF6f6dAt0G79yfdH06TAndtrQ8wk6zO&q'

    pokemon_response = HTTParty.get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json")
    pokemon_body = JSON.parse(pokemon_response.body)


    @pokemon_image        = pokemon_body['pokemon'].first['img']
    @pokemon_id           = pokemon_body['pokemon'].first["id"]
    @pokemon_name         = pokemon_body['pokemon'].first["name"]
    @pokemon_type         = pokemon_body['pokemon'].first["type"]
    @pokemon_height       = pokemon_body['pokemon'].first["height"]
    @pokemon_weight       = pokemon_body['pokemon'].first["weight"]
    @pokemon_candy        = pokemon_body['pokemon'].first["candy"]
    @pokemon_spawn_chance = pokemon_body['pokemon'].first["spawn_chance"]
    @pokemon_avg_spawns   = pokemon_body['pokemon'].first["avg_spawns"]
    @pokemon_spawn_time   = pokemon_body['pokemon'].first["spawn_time"]
    @pokemon_multipliers  = pokemon_body['pokemon'].first["multipliers"]
    @pokemon_weaknesses   = pokemon_body['pokemon'].first["weaknesses"]

    gif_response = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{key}&q=#{@pokemon_name}&rating=g")
    gif_body = JSON.parse(gif_response.body)
    @gif_id = gif_body['data'].first['id']


        if params[:term]

          pokemon_body['pokemon'].each do |poke|

          if poke['name'].downcase == params[:term].downcase

          @pokemon_image         = poke['img']
          @pokemon_id           = poke["id"]
          @pokemon_name         = poke["name"]
          @pokemon_type         = poke["type"]
          @pokemon_height       = poke["height"]
          @pokemon_weight       = poke["weight"]
          @pokemon_candy        = poke["candy"]
          @pokemon_spawn_chance = poke["spawn_chance"]
          @pokemon_avg_spawns   = poke["avg_spawns"]
          @pokemon_spawn_time   = poke["spawn_time"]
          @pokemon_multipliers  = poke["multipliers"]
          @pokemon_weaknesses   = poke["weaknesses"]


          gif_response = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{key}&q=#{@pokemon_name}&rating=g")
          gif_body = JSON.parse(gif_response.body)
          @gif_id = gif_body['data'].first['id']

        end


      end
    end

  end









end
