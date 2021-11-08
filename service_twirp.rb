# Code generated by protoc-gen-twirp_ruby 1.9.0, DO NOT EDIT.
require 'twirp'
require_relative 'service_pb.rb'

module Example
  class HelloWorldService < Twirp::Service
    package "example"
    service "HelloWorld"
    rpc :Hello, HelloRequest, HelloResponse, :ruby_method => :hello
  end

  class HelloWorldClient < Twirp::Client
    client_for HelloWorldService
  end
end

class HelloWorldHandler
  def hello(req, env)
    if req.name.empty?
      return Twirp::Error.invalid_argument("name is mandatory")
    end
    {message: "Hello #{req.name}"}
  end
end



###--------------------------



base_url = "http://localhost:3000/twirp"
client = HelloWorldClient.new(base_url)
client.rpc(:Hello, HelloRequest.new(name: "World")) # generic rpc method
client.hello(HelloRequest.new(name: "World")) # DSL method with message object
client.hello(name: "World") # DSL method with message attributes