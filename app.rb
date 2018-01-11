require 'bundler/setup'
Bundler.require
require "open-uri"
require "nokogiri"
require 'fileutils'

get '/' do
    erb :form
end

get '/view' do
    url = params[:url]
    html = open(url,:proxy => "http://177.74.61.240:8080").read
    parsed_html = Nokogiri::HTML.parse(html,nil,'utf-8')
    anchor = parsed_html.xpath("/html/body/div[1]/main/div[1]/section[1]/div[1]/div/div/div[1]/img")
    image = anchor.attr("data-src").value
    fileName = File.basename(image)
    dirName = "public/images/"
    filePath = dirName + fileName

  # write image adata
  open(filePath, 'wb') do |output|
    open(image) do |data|
      output.write(data.read)
       original = Magick::Image.read(filePath).first
       original.format = "PNG"
        reimage = original.matte_replace(0, 0)
        pngfile = "#{filePath}.png"
        reimage.write(pngfile)
        front = Magick::Image.read(pngfile).first
        back = Magick::Image.read('back.jpg').first
       back.format = "PNG"
        result = back.composite(front, 2100, 1200, Magick::OverCompositeOp)
        @resultpng = "new_#{fileName}.png"
        result.write("public/images/#{@resultpng}")
    end
  end
  erb :view
end