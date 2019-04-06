ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.include ActionView::Helpers::TranslationHelper
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
