require 'spec_helper'

describe ChunkyPNG::Canvas::PNGEncoding do
  include ChunkyPNG::Canvas::PNGEncoding

  describe '.encode_png' do
    [:indexed, :grayscale, :grayscale_alpha, :truecolor, :truecolor_alpha].each do |color_mode_name|
      it "should encode an image with color mode #{color_mode_name} correctly" do
        filename = resource_file("_tmp_#{color_mode_name}.png")
        canvas = ChunkyPNG::Canvas.new(10, 10, ChunkyPNG::Color.rgb(100, 100, 100))
        color_mode = ChunkyPNG.const_get("COLOR_#{color_mode_name.to_s.upcase}")
        canvas.save(filename, :color_mode => color_mode)
        
        ds = ChunkyPNG::Datastream.from_file(filename)
        ds.header_chunk.color.should == color_mode
        ChunkyPNG::Canvas.from_datastream(ds).should == reference_canvas('gray_10x10')
        
        File.unlink(filename)
      end
    end
    
    it "should encode an image with interlacing correctly" do
      input_canvas = ChunkyPNG::Canvas.from_file(resource_file('16x16_non_interlaced.png'))
      filename = resource_file("_tmp_interlaced.png")
      input_canvas.save(filename, :interlace => true)
      
      ds = ChunkyPNG::Datastream.from_file(filename)
      ds.header_chunk.interlace.should == ChunkyPNG::INTERLACING_ADAM7
      ChunkyPNG::Canvas.from_datastream(ds).should == input_canvas

      File.unlink(filename)
    end

    it "should save an image using the normal routine correctly" do
      canvas = reference_canvas('operations')
      Zlib::Deflate.should_receive(:deflate).with(anything, Zlib::DEFAULT_COMPRESSION).and_return('')
      canvas.to_blob
    end


    it "should save an image using the :best_compression routine correctly" do
      canvas = reference_canvas('operations')
      canvas.should_not_receive(:encode_png_scanline)
      Zlib::Deflate.should_receive(:deflate).with(anything, Zlib::BEST_SPEED).and_return('')
      canvas.to_blob(:fast_rgba)
    end

    it "should save an image using the :best_compression routine correctly" do
      canvas = reference_canvas('operations')
      canvas.should_receive(:encode_png_scanline_paeth).at_least(:once).and_return([5, 0, 0, 0, 0, 0, 0])
      Zlib::Deflate.should_receive(:deflate).with(anything, Zlib::BEST_COMPRESSION).and_return('')
      canvas.to_blob(:best_compression)
    end
  end

  describe '#encode_scanline' do

    it "should encode a scanline without filtering correctly" do
      current = [0, 0, 0, 1, 1, 1, 2, 2, 2]
      encoded = encode_png_scanline(ChunkyPNG::FILTER_NONE, current, nil)
      encoded.should == [0, 0, 0, 0, 1, 1, 1, 2, 2, 2]
    end

    it "should encode a scanline with sub filtering correctly" do
      current = [255, 255, 255, 255, 255, 255, 255, 255, 255]
      encoded = encode_png_scanline(ChunkyPNG::FILTER_SUB, current, nil)
      encoded.should == [1, 255, 255, 255, 0, 0, 0, 0, 0, 0]
    end

    it "should encode a scanline with up filtering correctly" do
      previous = [255, 255, 255, 255, 255, 255, 255, 255, 255]
      current  = [255, 255, 255, 255, 255, 255, 255, 255, 255]
      encoded  = encode_png_scanline(ChunkyPNG::FILTER_UP, current, previous)
      encoded.should == [2, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    end
    
    it "should encode a scanline with average filtering correctly" do
      previous = [10, 20, 30, 40, 50, 60, 70, 80,   80, 100, 110, 120]
      current  = [ 5, 10, 25, 45, 45, 55, 80, 125, 105, 150, 114, 165]
      encoded  = encode_png_scanline(ChunkyPNG::FILTER_AVERAGE, current, previous)
      encoded.should == [3, 0, 0, 10, 23, 15, 13, 23, 63, 38, 60, 253, 53]
    end
    
    it "should encode a scanline with paeth filtering correctly" do
      previous = [10, 20, 30, 40, 50, 60, 70, 80,  80, 100, 110, 120]
      current  = [10, 20, 40, 60, 60, 60, 70, 120, 90, 120,  54, 120]
      encoded  = encode_png_scanline(ChunkyPNG::FILTER_PAETH, current, previous)
      encoded.should == [4, 0,  0, 10, 20, 10,  0,  0, 40, 10,  20, 190,   0]
    end
  end
end
