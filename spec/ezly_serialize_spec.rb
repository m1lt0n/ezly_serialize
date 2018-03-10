require 'json'

RSpec.describe EzlySerialize do
  it "has a version number" do
    expect(EzlySerialize::VERSION).not_to be nil
  end

  it "Serializes object to json properly" do
    sut = Person.new('Jason')
    serialized = sut.serialize
    expect(serialized).to eq(JSON.dump({name: 'Jason'}))
  end
  
  it "Deserializes object from json properly" do
    sut = Person.new(nil)
    sut.deserialize(JSON.dump({name: 'Jason'}))
    expect(sut.name).to eq('Jason')
  end

  EzlySerialize::Configuration.options do |o|
    o.serializer JSON
  end

  class Person
    include EzlySerialize

    attr_reader :name

    def initialize(name)
      @name = name
    end
  end

end
