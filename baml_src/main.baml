// generators are currently necessary for code generation
generator lang_ruby {
  language ruby
  // This is where your non-baml source code located
  // (relative directory where Gemfile lives)
  project_root ".."
  test_command "ruby test"
  install_command "bundle update baml"
  package_version_command "bundle info baml"
}
