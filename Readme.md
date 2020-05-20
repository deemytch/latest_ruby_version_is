# latest ruby version is which?

`latest_ruby_version_is( src, fallback: true ) #=> String`

Returns a string like "2.7.1".

`src` can be either `:remote` or `:local`.

When `:remote` it grabs version from GitHub ruby project, when `:local`, it's just a constant in the code.

When `fallback` is true, and there are network problems, it fallbacks to the constant.

Using like:

    if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.5.2')
      require 'latest_ruby_version_is'
      raise "Wanna #{ latest_ruby_version_is } ruby, :(me crying)."
    end

That's all folks.
