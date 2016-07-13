# Subdomains
Short description and motivation.

## Usage
Inside a controller, include the module and call into `parse_subdomains` to set
up the parsing and callbacks.  

```ruby
class TestController < ApplicationController
  include Subdomains
  parse_subdomains(position: 2, callback: :subdomain)
  parse_subdomains(regex: /l_(.+)/, callback: :subdomain)
  def subdomain(match)
    # Your code!
  end
end
```

In this example there is both a positional match and a regular expression match.
the callback will be called with the patched part.  Positional arguments return
the entire part, while regular expression returns just the first match.

As a result, in the example, `foo.bar.example.com` will match on "foo" for the
positional match, and nothing on the regular expression.  `l_bar.example.com`,
will match with "bar" with the regular expression.  In the case of `foo.l_bar.example.com`, `subdomain()`
will be called twice, once for "foo" and once for "bar".  There is no
guarantee of the order in which `subdomain()` will be called so be careful.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'subdomains', github: 'exegete46/rails-subdomains'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install subdomains
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
