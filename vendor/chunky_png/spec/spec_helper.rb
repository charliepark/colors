$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rubygems'
require 'bundler'

Bundler.setup

require 'spec'
require 'chunky_png'

module ResourceFileHelper
  def resource_file(name)
    File.expand_path("./resources/#{name}", File.dirname(__FILE__))
  end
end


module MatrixSpecHelper
  def display(canvas)
    filename = resource_file('_tmp.png')
    canvas.to_datastream.save(filename)
    `open #{filename}`
  end
  
  def reference_canvas(name)
    ChunkyPNG::Canvas.from_file(resource_file("#{name}.png"))
  end
end

Spec::Runner.configure do |config|
  config.include ResourceFileHelper
  config.include MatrixSpecHelper
end
