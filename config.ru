require 'rubygems'
require 'set'
require 'zlib'
require 'stringio'
require 'enumerator'

require 'vendor/chunky_png/lib/chunky_png/datastream.rb'
require 'vendor/chunky_png/lib/chunky_png/chunk.rb'
require 'vendor/chunky_png/lib/chunky_png/palette.rb'
require 'vendor/chunky_png/lib/chunky_png/color.rb'
require 'vendor/chunky_png/lib/chunky_png/canvas/png_encoding.rb'
require 'vendor/chunky_png/lib/chunky_png/canvas/png_decoding.rb'
require 'vendor/chunky_png/lib/chunky_png/canvas/adam7_interlacing.rb'
require 'vendor/chunky_png/lib/chunky_png/canvas/stream_exporting.rb'
require 'vendor/chunky_png/lib/chunky_png/canvas/stream_importing.rb'
require 'vendor/chunky_png/lib/chunky_png/canvas/operations.rb'
require 'vendor/chunky_png/lib/chunky_png/canvas/drawing.rb'
require 'vendor/chunky_png/lib/chunky_png/canvas.rb'
require 'vendor/chunky_png/lib/chunky_png/image.rb'

require 'vendor/chunky_png/lib/chunky_png.rb'

require 'vendor/sinatra/lib/sinatra.rb'

set :run, false
set :environment, :production

require 'colors.rb'
run Sinatra::Application