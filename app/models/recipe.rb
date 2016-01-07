class Recipe 
  include HTTParty
  
 hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] || "www.food2fork.com"
  base_uri "http://#{hostport}/api"
  default_params key: ENV["FOOD2FORK_KEY"] || "4c553f80277adb2eccdc9588692fdfff"
  format :json

  def self.for keyword
    get("/search", query: {q: keyword})["recipes"]
  end

end
