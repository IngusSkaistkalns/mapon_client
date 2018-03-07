# MaponClient

Ruby client library for https://www.mapon.com API

### GET API
Check `lib/mapon_client/resources/*` for supported resource actions.

### POST API
`POST` actions still can be executed by using `MaponClient::Client#resource_base`,
that is `RestClient::Resource` instance already with parameter `key` set.
Thought currently RestClient does not handle parameter merging.
It completely overrides parameters set on Resource init, so `MaponClient::Client#with_key` is available
for appending key to payload.

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
  * *api_key* - create it under Settings/API keys, if left blank, will try to utilize environment variable *MAPON_CLIENT_API_KEY*
  * *base_url* - defaults to https://mapon.com/api/v1/
  * *format* - json/xml/structure/object, defaults to json
    - json - raw json string from response,
    - xml - raw xml string from response,
    - structure - ruby Array and Hash structure (HTTP request gets made with format json),
    - object - ruby OpenStruct objects (HTTP request gets made with format json)

```ruby
mapon_client = MaponClient::Client.new
# OR
mapon_client = MaponClient::Client.new(
  api_key: 'some-api-key-goes-here',
  base_url: 'https://mapon.com/api/v2/',
  format: 'xml'
)
```

### Structure and Object formats

For format structure and object all requests are still made using json, but response gets parsed.
In case of structure it is `JSON.parse(response)`.
In case of object it is `JSON.parse(response, object_class: OpenStruct)`.

### Request resources

Mapon API documentation can be found [here](https://mapon.com/api).
Look there to find out required params in case error messages are not clear enough.

#### Company
```ruby
@mapon_client.company.get
```

#### Unit list
```ruby
@mapon_client.unit.list
@mapon_client.unit.list(
  unit_id: [80669', 85113], car_number: ['VY92278', 'DK56625'], empty_box_id: true,
  include: [
    'in_objects', 'io_din', 'fuel', 'can', 'reefer', 'drivers', 'temperature', 'ambienttemp', 'device', 'supply_voltage'
  ]
)
```

#### Unit group
```ruby
@mapon_client.unit_group.list(unit_id: [80669, 85113])

@mapon_client.unit_group.list_units(id: 11677)

```

#### Unit data
```ruby
@mapon_client.unit_data.ignitions(
  from: '2018-02-01T00:00:00Z', till: '2018-02-10T00:00:00Z', unit_id: [80669, 85113]
)

@mapon_client.unit_data.temperature(
  from: '2018-02-01T00:00:00Z', till: '2018-02-20T00:00:00Z', unit_id: 80669
)

@mapon_client.unit_data.digital_inputs(
  from: '2018-02-01T00:00:00Z', till: '2018-02-20T00:00:00Z', unit_id: 80669
)

@mapon_client.unit_data.can_period(
  datetime: '2018-02-01T00:00:00Z', unit_id: 80669,
  include: [
    'rpm_average', 'rpm_max', 'fuel_level', 'service_distance', 'total_distance', 'total_fuel', 'total_engine_hours', 'ambient_temperature'
  ]
)

@mapon_client.unit_data.can_point(
  from: '2018-02-01T00:00:00Z', till: '2018-02-20T00:00:00Z', unit_id: 80669,
  include: [
    'rpm_average', 'rpm_max', 'fuel_level', 'service_distance', 'total_distance', 'total_fuel', 'total_engine_hours', 'ambient_temperature'
  ]
)

@mapon_client.unit_data.fields(unit_id: 85188)
```

#### Reefer
```ruby
@mapon_client.reefer.alert_list(id: 12345, unit_id: [80669, 85113])

@mapon_client.reefer.runmodes(unit_id: [80669, 85113])

@mapon_client.reefer.list_temperature_data(
  unit_id: 85113, from: '2018-01-20T00:00:00Z', till: '2018-03-03T00:00:00Z'
)
```

#### Route
```ruby
@mapon_client.route.list(
  from: '2018-02-20T00:00:00Z', till: '2018-03-06T00:00:00Z', unit_id: [80669, 85113], empty_box_id: true,
  include: ['polyline', 'speed', 'decoded_route', 'driver_id']
)

@mapon_client.route.custom_fields(route_id: 639655550)
```

*For decoding polyline use https://github.com/joshuaclayton/polylines*

#### Fuel
```ruby
@mapon_client.fuel.summary(
  from: '2018-02-20T00:00:00Z', till: '2018-03-06T00:00:00Z', unit_id: [86303, 80669]
)

@mapon_client.fuel.changes(
  from: '2018-02-20T00:00:00Z', till: '2018-03-06T00:00:00Z', unit_id: [86303, 80669]
)
```

#### Object
```ruby
@mapon_client.object.list(
  id: 345901, name: 'Depot', group_id: 0, deleted: 1, updated_from: '2017-12-22T09:50:23Z', updated_till: '2017-12-22T09:55:25Z'
)

@mapon_client.object.list_groups(id: 1234, name: 'Group name')
```

#### User
```ruby
@mapon_client.user.list(id: '116361', type: 'user_all')
```

#### Driver
```ruby
@mapon_client.driver.list(id: 116551)
```

#### Tachograph
```ruby
@mapon_client.tachograph.list_ddd_driver(from: '2018-02-20T00:00:00Z', till: '2018-03-03T00:00:00Z')

@mapon_client.tachograph.download_ddd_driver(id: 55)

@mapon_client.tachograph.list_ddd_vehicle(from: '2018-02-20T00:00:00Z', till: '2018-03-03T00:00:00Z')

@mapon_client.tachograph.download_ddd_vehicle(id: 55)
```

#### Tracking
```ruby
@mapon_client.tracking.list(from: '2018-02-20T00:00:00Z', till: '2018-03-03T00:00:00Z')
```

#### Data forward
```ruby
@mapon_client.data_forward.list

@mapon_client.data_forward.list_packs
```

#### Application menu
```ruby
@mapon_client.application_menu.list
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
