require 'net/http'

def latest_ruby_version_is( src, fallback: true )
  NOW_IS = '2.7.1'
  case src
  when :local then NOW_IS
  when :remote
    begin
      Net::HTTP.get( URI 'https://www.ruby-lang.org/en/downloads/')[ /The current stable version is (\d+\.\d+\.\d+)/, 1 ]
    rescue
      fallback ? NOW_IS : raise
    end
  else
    raise ArgumentError.new( 'src must be :local or :remote.' )
  end
end
