require "sinatra"
require "sinatra/logger"
require "socket"

set :bind, "0.0.0.0"

get "/" do
  @hostname = Socket.gethostname

  # Environmental Variables
  @release = ENV['RELEASE']
  @workshop = ENV['WORKSHOP_TITLE']
  @trainer = ENV['TRAINER']
  @location = ENV['LOCATION']

  logger.info "Hostname: #{@hostname}"
  logger.info "Release: #{@release}"

  erb :index
end

get "/readiness" do
  logger.info "Readiness Probe"
  status 200
end

get "/liveness" do
  logger.info "Liveness Probe"
  status 200
end

get "/brokeness" do
  logger.info "Brokeness Probe"

  random = rand(1...10)

  return status 500 if random <= 3
  status 200
end
