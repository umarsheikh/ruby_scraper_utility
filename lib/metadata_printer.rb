require 'nokogiri'

class MetadataPrinter
  attr_reader :url, :time, :page_fetcher, :doc

  def initialize(url)
    @url = url
    @time = Time.now
    @page_fetcher = WebpageFetcher.new(url)
    @doc ||= Nokogiri::HTML(page_fetcher.response)
  end

  def print
    metadata.each { |k, v| puts "#{k}: #{v}" }
  end

  private

  def links_count
    doc.css('a').length
  end

  def images_count
    doc.css('img').length
  end

  def metadata
    {
      site: page_fetcher.base_url,
      num_links: links_count,
      images: images_count,
      last_fetch: time
    }
  end
end
