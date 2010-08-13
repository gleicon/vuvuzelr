# sinatra/thin based proxy
require 'rubygems'
require 'sinatra'
require 'nokogiri'
require 'open-uri'

get '/url/*' do
  url = params["splat"].to_s
  redirect '/' unless validate_url url
  filter_and_replace url
end

post '/url' do
  url = params[:url]
  redirect '/' unless validate_url url
  filter_and_replace url
end

def filter_and_replace(url)
  doc = Nokogiri::HTML open url
  eb = Nokogiri::XML::Node.new 'embed', doc
  eb['src'] = 'http://vuvuzelr.7co.cc/derp.swf'
  eb['width'] = '1'
  eb['height'] = '1'
  eb['wmode'] = 'transparent'
  body = doc.at_css 'body'
  body << eb
  doc.search('img').each do |l| l['src']= 'http://vuvuzelr.7co.cc/vuvuzela.jpg' end
  doc.to_s
end

def validate_url(url)
  u = URI.parse url
  return true if u.class == URI::HTTP or u.class == URI::HTTPS
  false
end
