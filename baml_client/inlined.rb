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
module Baml
  module Inlined
    FILE_MAP = {
        
        "classify_message.baml" => "enum Category {\n    Refund\n    CancelOrder\n    TechnicalSupport\n    AccountIssue\n    Question\n}\n\nclass MessageFeatures {\n    categories Category[]\n}\n\nfunction ClassifyMessage(input: string) -> MessageFeatures {\n  client GPT4Turbo\n\n  prompt #\"\n    {# _.chat(\"system\") starts a system message #}\n    {{ _.chat(\"system\") }}\n\n    Classify the following INPUT.\n\n    {{ ctx.output_format }}\n\n    {# This starts a user message #}\n    {{ _.chat(\"user\") }}\n\n    INPUT: {{ input }}\n\n    Response:\n  \"#\n}",
        "clients.baml" => "// These are LLM clients you can use in your functions. We currently support Anthropic, OpenAI / Azure, and Ollama as providers but are expanding to many more.\n\n// For this playground, we have setup a few clients for you to use already with some free credits.\n\nclient<llm> GPT4 {\n  // Use one of the following: https://docs.boundaryml.com/v3/syntax/client/client#providers\n  provider baml-openai-chat\n  // You can pass in any parameters from the OpenAI Python documentation into the options block.\n  options {\n    model gpt-4\n    api_key env.OPENAI_API_KEY\n  }\n} \n\nclient<llm> GPT4Turbo {\n  provider baml-openai-chat\n  options {\n    model gpt-4-1106-preview\n    api_key env.OPENAI_API_KEY\n  }\n} \n\nclient<llm> GPT35 {\n  provider baml-openai-chat\n  options {\n    model gpt-3.5-turbo\n    api_key env.OPENAI_API_KEY\n  }\n}  \n\nclient<llm> Claude {\n  provider baml-anthropic-chat\n  options {\n    model claude-3-haiku-20240307\n    api_key env.ANTHROPIC_API_KEY\n  }\n}",
        "extract_order_info.baml" => "// In this example we tell the model to think step by step and explain its reasoning\n// before outputting the answer.\n\n// Run this prompt, and you'll notice the BAML function still returns the expected return type (OrderInfo),\n// even though there is a bunch of \"reasoning\" text present (see View Raw Output toggle). It works with streaming or even standalone enum outputs too!\nclass Email {\n    subject string\n    body string\n    from_address string\n}\n\nenum OrderStatus {\n    ORDERED\n    SHIPPED\n    DELIVERED\n    CANCELLED\n}\n\nclass OrderInfo {\n    order_status OrderStatus\n    tracking_number string?\n    estimated_arrival_date string?\n}\n\nfunction ExtractOrderInfo(email: Email) -> OrderInfo {\n  client GPT4Turbo\n  prompt #\"\n    Given the email below:\n\n     --- \n    from: {{email.from_address}}\n    Email Subject: {{email.subject}}\n    Email Body: {{email.body}}\n    ---\n\n    Extract this info from the email in JSON format:\n    {{ ctx.output_format }}\n  \"#\n}",
        "main.baml" => "// generators are currently necessary for code generation\ngenerator lang_ruby {\n  language ruby\n  // This is where your non-baml source code located\n  // (relative directory where Gemfile lives)\n  project_root \"..\"\n  test_command \"ruby test\"\n  install_command \"bundle update baml\"\n  package_version_command \"bundle info baml\"\n}\n",
    }
  end
end