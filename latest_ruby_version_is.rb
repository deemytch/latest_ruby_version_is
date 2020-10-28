require 'net/http'
require 'json'

LATEST_HARDCODED_RUBY_VERSION = '2.7.2'.freeze

def latest_ruby_version_is( src = :remote , fallback = true )
  case src
  when :local then LATEST_HARDCODED_RUBY_VERSION
  when :remote
    begin
      JSON.parse(
        Net::HTTP.get( URI 'https://api.github.com/repos/ruby/ruby/tags?per_page=1')
        ).find{|i| i['name'] !~ /preview/ }.i['name'][1..-1].gsub('_','.')
    rescue
      fallback ? LATEST_HARDCODED_RUBY_VERSION : raise
    end
  else
    raise ArgumentError.new( 'src must be :local or :remote.' )
  end
end
