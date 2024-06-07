###############################################################################
#
#  Welcome to Baml! To use this generated code, please run the following:
#
#  $ bundle add baml sorbet-runtime sorbet-coerce sorbet-struct-comparable
#
###############################################################################

# This file was generated by BAML: please do not edit it. Instead, edit the
# BAML files and re-generate this code.
#
# frozen_string_literal: true
# rubocop: disable
# formatter:off
# typed: false
require "baml"
require "sorbet-coerce"
require "sorbet-runtime"

require_relative "inlined"
require_relative "partial-types"
require_relative "types"

module Baml
  @instance = nil

  def self.Client
    if @instance.nil?
      @instance = BamlClient.new(runtime: Baml::Ffi::BamlRuntime.from_files("baml_src", Baml::Inlined::FILE_MAP, ENV))
    end
  
    @instance
  end

  class BamlClient
    extend T::Sig

    sig { returns(BamlStreamClient) }
    attr_reader :stream

    sig {params(runtime: Baml::Ffi::BamlRuntime).void}
    def initialize(runtime:)
      @runtime = runtime
      @ctx_manager = runtime.create_context_manager()
      @stream = BamlStreamClient.new(runtime: @runtime, ctx_manager: @ctx_manager)
    end

    sig {params(path: String).returns(BamlClient)}
    def self.from_directory(path)
      BamlClient.new(runtime: Baml::Ffi::BamlRuntime.from_directory(path, ENV))
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
        "ClassifyMessage",
        {
          "input" => input,
        },
        @ctx_manager,
      )
      (raw.parsed_using_types(Baml::Types))
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
        "ExtractOrderInfo",
        {
          "email" => email,
        },
        @ctx_manager,
      )
      (raw.parsed_using_types(Baml::Types))
    end

    

  end

  class BamlStreamClient
    extend T::Sig

    sig {params(runtime: Baml::Ffi::BamlRuntime, ctx_manager: Baml::Ffi::RuntimeContextManager).void}
    def initialize(runtime:, ctx_manager:)
      @runtime = runtime
      @ctx_manager = ctx_manager
    end

    sig {
      params(
        input: String,
      ).returns(Baml::BamlStream[Baml::Types::MessageFeatures])
    }
    def ClassifyMessage(
        input:
    )
      raw = @runtime.stream_function(
        "ClassifyMessage",
        {
          "input" => input,
        },
        @ctx_manager,
      )
      Baml::BamlStream[Baml::PartialTypes::MessageFeatures, Baml::Types::MessageFeatures].new(
        ffi_stream: raw,
        partial_coerce: TypeCoerce[Baml::PartialTypes::MessageFeatures],
        final_coerce: TypeCoerce[Baml::Types::MessageFeatures],
        ctx_manager: @ctx_manager
      )
    end

    sig {
      params(
        email: Baml::Types::Email,
      ).returns(Baml::BamlStream[Baml::Types::OrderInfo])
    }
    def ExtractOrderInfo(
        email:
    )
      raw = @runtime.stream_function(
        "ExtractOrderInfo",
        {
          "email" => email,
        },
        @ctx_manager,
      )
      Baml::BamlStream[Baml::PartialTypes::OrderInfo, Baml::Types::OrderInfo].new(
        ffi_stream: raw,
        partial_coerce: TypeCoerce[Baml::PartialTypes::OrderInfo],
        final_coerce: TypeCoerce[Baml::Types::OrderInfo],
        ctx_manager: @ctx_manager
      )
    end

    
  end
end