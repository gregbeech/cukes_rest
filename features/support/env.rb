require File.join(File.dirname(__FILE__), "..", "..", "fruit_app")
require "rack/test"

module KnowsAboutTheFruitApp
  def app
    FruitApp.new
  end
end

World(KnowsAboutTheFruitApp, Rack::Test::Methods)