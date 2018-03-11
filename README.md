# EzlySerialize

EzlySerialize is a very simple gem that allows serialization of objects. It works out of the box with Marshal, JSON and MessagePack, but can be extended to work with any ser/deserializer that implements the methods ```dump``` and ```load``` in a similar way as JSON.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ezly_serialize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ezly_serialize

## Usage

Let's assume that you have an object Person that looks like this

```ruby
class Person
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
end
```

In order to use ```EzlySerialize```, you only need to include the module in the class
and configure ```EzlySerialize``` to use the serializer of your preference.

```ruby
class Person
  include EzlySerialize

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

EzlySerialize::Configuration.serializer(JSON)
```

That's it! You can now easily serialize your object like that:

```ruby
me = Person.new('Jason')
serialized = me.serialize # => {"name": "Jason"}
```

If you want to hydrate an object from a serialized value, you can use the deserialize
method:

```ruby
me = Person.new(nil)
me.deserialize(serialized)
puts me.name # => "Jason"
```

Note: EzlySerialize is not opinionated about deserialization and I've chosen to let the user
instantiate the object and just hydrate it from a serialized object instead of
engaging into metaprogramming and setting rules and conventions.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ezly_serialize. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EzlySerialize project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ezly_serialize/blob/master/CODE_OF_CONDUCT.md).
