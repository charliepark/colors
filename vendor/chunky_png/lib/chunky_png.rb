require 'set'
require 'zlib'
require 'stringio'
require 'enumerator'

require 'chunky_png/datastream.rb'
require 'chunky_png/chunk.rb'
require 'chunky_png/palette.rb'
require 'chunky_png/color.rb'
require 'chunky_png/canvas/png_encoding.rb'
require 'chunky_png/canvas/png_decoding.rb'
require 'chunky_png/canvas/adam7_interlacing.rb'
require 'chunky_png/canvas/stream_exporting.rb'
require 'chunky_png/canvas/stream_importing.rb'
require 'chunky_png/canvas/operations.rb'
require 'chunky_png/canvas/drawing.rb'
require 'chunky_png/canvas.rb'
require 'chunky_png/image.rb'

# ChunkyPNG - the pury ruby library to access PNG files.
#
# The ChunkyPNG module defines some constants that are used in the
# PNG specification.
#
# @author Willem van Bergen
module ChunkyPNG

  # The current version of ChunkyPNG. This value will be updated automatically
  # by them gem:release rake task.
  VERSION = "0.9.0"

  ###################################################
  # PNG international standard defined constants
  ###################################################

  COLOR_GRAYSCALE       = 0
  COLOR_TRUECOLOR       = 2
  COLOR_INDEXED         = 3
  COLOR_GRAYSCALE_ALPHA = 4
  COLOR_TRUECOLOR_ALPHA = 6

  FILTERING_DEFAULT     = 0

  COMPRESSION_DEFAULT   = 0

  INTERLACING_NONE      = 0
  INTERLACING_ADAM7     = 1

  FILTER_NONE           = 0
  FILTER_SUB            = 1
  FILTER_UP             = 2
  FILTER_AVERAGE        = 3
  FILTER_PAETH          = 4

  ###################################################
  # ChunkyPNG exception classes
  ###################################################

  # Default exception class for ChunkyPNG
  class Exception < ::StandardError
  end

  # Exception that is raised for an unsopported PNG image.
  class NotSupported < ChunkyPNG::Exception
  end

  # Exception that is raised if the PNG signature is not encountered at the 
  # beginning of the file.
  class SignatureMismatch < ChunkyPNG::Exception
  end

  # Exception that is raised if the CRC check for a block failes
  class CRCMismatch < ChunkyPNG::Exception
  end

  # Exception that is raised if an expectation fails.
  class ExpectationFailed < ChunkyPNG::Exception
  end

  # Exception that is raised if an expectation fails.
  class OutOfBounds < ChunkyPNG::ExpectationFailed
  end
end
