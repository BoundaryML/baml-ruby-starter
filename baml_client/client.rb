###############################################################################
#
#  Welcome to Baml! To use this generated code, please run the following:
#
#  $ bundle add sorbet-runtime sorbet-coerce sorbet-struct-comparable
#
###############################################################################

# This file was generated by BAML: please do not edit it.
#
# frozen_string_literal: true
# rubocop: disable
# formatter:off

# typed: strict
require "baml"
require "sorbet-runtime"

require_relative "types"

module Baml

  class BamlClient
    extend T::Sig

    sig { returns(UnstableBamlClient) }
    attr_reader :unstable

    sig {params(runtime: Baml::Ffi::BamlRuntime).void}
    def initialize(runtime:)
      @runtime = runtime
      @unstable = T.let(UnstableBamlClient.new(runtime: runtime), UnstableBamlClient)
    end

    sig {params(path: String).returns(BamlClient)}
    def self.from_directory(path)
      BamlClient.new(runtime: Baml::Ffi::BamlRuntime.from_directory(path))
    end

    sig {
      params(
        input: String,
      ).returns(Baml::Types::MessageFeatures)
    }
    def ClassifyMessage(
        input:
    )
      raw = @runtime.call_function(
        function_name: "ClassifyMessage",
        args: {
          "input" => input,
        }
      )
      Baml::convert_to(Baml::Types::MessageFeatures).from(raw.parsed)
    end

    sig {
      params(
        email: Baml::Types::Email,
      ).returns(Baml::Types::OrderInfo)
    }
    def ExtractOrderInfo(
        email:
    )
      raw = @runtime.call_function(
        function_name: "ExtractOrderInfo",
        args: {
          "email" => email,
        }
      )
      Baml::convert_to(Baml::Types::OrderInfo).from(raw.parsed)
    end

    

  end

  class UnstableBamlClient
    extend T::Sig

    sig {params(runtime: Baml::Ffi::BamlRuntime).void}
    def initialize(runtime:)
      @runtime = runtime
    end

    sig {
      params(
        input: String,
      ).returns(Baml::Unstable::FunctionResult[Baml::Types::MessageFeatures])
    }
    def ClassifyMessage(
        input:
    )
      raw = @runtime.call_function(
        function_name: "ClassifyMessage",
        args: {
          "input" => input,
        }
      )
      Baml::Unstable::FunctionResult[Baml::Types::MessageFeatures].new(
        inner: raw,
        parsed: Baml::convert_to(Baml::Types::MessageFeatures).from(raw.parsed)
      )
    end

    sig {
      params(
        email: Baml::Types::Email,
      ).returns(Baml::Unstable::FunctionResult[Baml::Types::OrderInfo])
    }
    def ExtractOrderInfo(
        email:
    )
      raw = @runtime.call_function(
        function_name: "ExtractOrderInfo",
        args: {
          "email" => email,
        }
      )
      Baml::Unstable::FunctionResult[Baml::Types::OrderInfo].new(
        inner: raw,
        parsed: Baml::convert_to(Baml::Types::OrderInfo).from(raw.parsed)
      )
    end

    
  end
end


