# frozen_string_literal: true
source "https://rubygems.org"

gem "baml", '~> 0.1.7'
gem "sorbet-coerce"
gem "sorbet-struct-comparable"
gem "sorbet-runtime"

group :development do
    # bigdecimal is in the dependency closure of sorbet-coerce
    # and is moving out of the standard library in Ruby 3.4
    gem "bigdecimal"
    gem "sorbet"
end
