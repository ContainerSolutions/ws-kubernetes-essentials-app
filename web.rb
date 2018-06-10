require "sinatra"
require "socket"

set :bind, "0.0.0.0"

get "/" do
  @hostname = Socket.gethostname
  @version = ENV['VERSION']

  erb :index
end

get "/readiness" do
  status 200
end

get "/liveness" do
  random = rand(1...10)

  return status 500 if random < 4
  status 200
end
