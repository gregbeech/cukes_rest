require "sinatra"

class FruitApp < Sinatra::Base
  set :data, ""
  set :cup_sizes, ""

  get "/fruits", provides: :json do
    MultiJson.dump(settings.data)
  end

  get "/cup-sizes", provides: :json do
    MultiJson.dump(settings.cup_sizes)
  end
end