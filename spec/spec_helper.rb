require "bundler/setup"
require "datamuse_rb"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Require Support Files
  Dir["./spec/support/**/*.rb"].sort.each { |f| require f }

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
