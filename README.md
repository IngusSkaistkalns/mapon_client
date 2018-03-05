# MaponClient

Ruby client library for https://www.mapon.com API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mapon_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mapon_client

## Usage

### Instantiate client:
  * api_key - create it under Settings/API keys, if blank, will try to read environment variable MAPON_CLIENT_API_KEY on the [site](https://mapon.com/new/settings#9) 
  * base_url - defaults to https://mapon.com/api/v1/
  * format - json/xml, defaults to json

```ruby
mapon_client = MaponClient::Client.new
# OR
mapon_client = MaponClient::Client.new(
  api_key: ENV['BY_DIFFERENT_NAME_API_KEY'],
  base_url: 'https://mapon.com/api/v300/not-the-default-endpoint',
  format: 'xml'
)
```
### Rest client

MaponClient uses [rest-client](https://github.com/rest-client/rest-client) as HTTP client.
So on any lower level calls rest-client library class instances gets returned,
like RestClient::Response, RestClient::Resource, etc.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/IngusSkaistkalns/mapon_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MaponClient project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mapon_client/blob/master/CODE_OF_CONDUCT.md).
