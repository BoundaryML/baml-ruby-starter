# typed: strict
require_relative "baml_client/client"
require "pp"

b = Baml::BamlClient.from_directory("baml_src")
input = "Can't access my account using my usual login credentials"
classified = b.ClassifyMessage(input: input)

puts classified.to_s