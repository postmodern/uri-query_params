# URI query_params

* [Source](https://github.com/postmodern/uri-query_params)
* [Issues](https://github.com/postmodern/uri-query_params/issues)
* [Documentation](http://rubydoc.info/gems/uri-query_params/frames)

## Description

Allows access to the query component of the URI as a Hash. This is similar
to `$_GET` from PHP, except available on any Ruby URI object.

## Examples

Inspecting the URI query_params:

```ruby
require 'uri/query_params'

url = URI('http://www.google.com/search?hl=en&client=firefox-a&rls=org.mozilla%3Aen-US%3Aofficial&hs=1HY&q=bob+ross&btnG=Search')
url.query_params
# => {"btnG"=>"Search", "hs"=>"1HY", "rls"=>"org.mozilla:en-US:official", "client"=>"firefox-a", "hl"=>"en", "q"=>"bob+ross"}

url.query_params['q']
# => "bob+ross"
```

Setting the URI query_params:

```ruby
url.query_params['q'] = 'Upright Citizens Brigade'
url.to_s
# => "http://www.google.com/search?btnG=Search&hs=1HY&rls=org.mozilla:en-US:official&client=firefox-a&hl=en&q=Upright%20Citizens%20Brigade"
```

Parsing URI query_params embedded within the Fragment Identifier:

```ruby
url = URI('https://twitter.com/#!/download?lang=en&logged_out=1')
URI(url.fragment).query_params
# => {"logged_out"=>"1", "lang"=>"en"}
```

## Requirements

* [ruby] >= 2.0.0

## Install

```shell
$ gem install uri-query_params
```

## License

See {file:LICENSE.txt} for license information.

[ruby]: https://www.ruby-lang.org/
