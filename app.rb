require 'bundler/setup'
Bundler.require
require "open-uri"
require "nokogiri"

get '/' do
    erb :form
end

get '/view' do
    url = params[:url]
    html = open(url).read
    parsed_html = Nokogiri::HTML.parse(html,nil,'utf-8')
    parsed_html.to_html
end
