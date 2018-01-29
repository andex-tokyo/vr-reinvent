require 'bundler/setup'
Bundler.require
require "open-uri"
require "nokogiri"
require 'fileutils'

get '/' do
    erb :form
end

get '/view' do
#     url = params[:url]
#     html = open(url,:proxy => "http://175.208.122.10:80").read
#     parsed_html = Nokogiri::HTML.parse(html,nil,'utf-8')
#     anchor = parsed_html.xpath("/html/body/div[1]/main/div[1]/section[1]/div[1]/div/div/div[1]/img")
#     image = anchor.attr("data-src").value
#     fileName = File.basename(image)
#     dirName = "public/images/"
#     filePath = dirName + fileName

#   # write image adata
#   open(filePath, 'wb') do |output|
#     open(image) do |data|
#       output.write(data.read)
#       original = Magick::Image.read(filePath).first
#       original.format = "PNG"
#         reimage = original.matte_replace(0, 0).resize(1024, 1024)
#         reimage.write("public/images/result.png")
    #     front = Magick::Image.read(pngfile).first
    #     back = Magick::Image.read('back.jpg').first
    #   back.format = "PNG"
    #     if pngfile == "public/images/m50754108265_1.jpg?1515672731.png"
    #         result = back.composite(front, 4720, 850, Magick::OverCompositeOp)
    #   else
    #         result = back.composite(front, 2100, 1000, Magick::OverCompositeOp)
    #     end
    #     result.write("public/images/result.png")
#     end
#   end
  erb :view
end