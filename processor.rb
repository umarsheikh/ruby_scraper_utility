require 'optparse'
require './lib/page_saver'
require './lib/metadata_printer'
require './lib/archiver'

class Processor
  def process
    options
    ARGV.each do |url|
      archiver = Archiver.new(url)
      archiver.archive
      MetadataPrinter.new(url, archiver.doc).print if options[:metadata]

    rescue => error
      ErrorPrinter.print("#{url}: #{error.message}")
      next
    end
  end

  def options
    return @options if defined? @options

    @options = {}
    OptionParser.new do |opts|
      opts.on("--metadata") { |v| @options[:metadata] = v }
    end.parse!
    @options
  end
end

Processor.new.process
