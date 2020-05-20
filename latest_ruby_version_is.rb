require 'net/http'

def latest_ruby_version_is( src = :remote , fallback: true )
  ruby_is = '2.7.1'.freeze
  case src
  when :local then ruby_is
  when :remote
    begin
      Net::HTTP.get( URI 'https://www.ruby-lang.org/en/downloads/')[ /The current stable version is (\d+\.\d+\.\d+)/, 1 ]
    rescue
      fallback ? ruby_is : raise
    end
  else
    raise ArgumentError.new( 'src must be :local or :remote.' )
  end
end
