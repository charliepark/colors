require 'rubygems'
require 'set'
require 'zlib'
require 'stringio'
require 'enumerator'

require 'vendor/chunky_png/lib/chunky_png/datastream'
require 'vendor/chunky_png/lib/chunky_png/chunk'
require 'vendor/chunky_png/lib/chunky_png/palette'
require 'vendor/chunky_png/lib/chunky_png/color'
require 'vendor/chunky_png/lib/chunky_png/canvas/png_encoding'
require 'vendor/chunky_png/lib/chunky_png/canvas/png_decoding'
require 'vendor/chunky_png/lib/chunky_png/canvas/adam7_interlacing'
require 'vendor/chunky_png/lib/chunky_png/canvas/stream_exporting'
require 'vendor/chunky_png/lib/chunky_png/canvas/stream_importing'
require 'vendor/chunky_png/lib/chunky_png/canvas/operations'
require 'vendor/chunky_png/lib/chunky_png/canvas/drawing'
require 'vendor/chunky_png/lib/chunky_png/canvas'
require 'vendor/chunky_png/lib/chunky_png/image'

require 'vendor/chunky_png/lib/chunky_png.rb'
require 'vendor/sinatra/lib/sinatra.rb'

set :run, false
set :environment, :production

require 'colors.rb'
run Sinatra::Application