# latest ruby version is which?

`latest_ruby_version_is( src, fallback: true ) #=> String`

Returns a string like "2.7.1".

`src` can be either :remote or :local.

When `:remote` it grabs version from _ruby-lang.org/en/downloads_, when `:local`, it's just a constant in the code.

When fallback is true, and there are network problems, it fallbacks to the constant.

That's all folks.
