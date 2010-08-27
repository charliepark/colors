require 'rubygems'
require 'vendor/chunky_png/lib/chunky_png.rb'
require 'vendor/sinatra/lib/sinatra.rb'

set :run, false
set :environment, :production

require 'colors.rb'
run Sinatra::Application