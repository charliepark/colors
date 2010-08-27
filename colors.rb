get '/' do
  redirect '/index.html'
end

get '/:hex.png' do
  redirect '/'+params[:hex]
end

get '/:hex' do
  hex = params[:hex].sub('.png','')
  if hex.size == 3
    original = hex
    triple = hex.split('')
    hex = ''
    triple.each {|n| hex << n*2}
  end
  png = ChunkyPNG::Image.new(1, 1, ChunkyPNG::Color::from_hex(hex))
  png.metadata['Author'] = 'Charlie Park'
  png.save('public/'+hex+'.png', :interlace => true)
  png.save('public/'+original+'.png', :interlace => true) if original  
  redirect '/'+hex+'.png'
end