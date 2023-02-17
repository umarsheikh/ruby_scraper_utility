require 'open-uri'
require File.join(File.expand_path(File.dirname(__FILE__)), 'error_printer')

class WebpageFetcher
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def response
    @response ||= URI.open(@url).read
  end

  def base_url
    url.split('://')[1].split('/').first.split('?').first
  end

  def doc
    @doc ||= Nokogiri::HTML(response)
  end
end
