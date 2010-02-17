RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.gem 'sqlite3-ruby', :lib => 'sqlite3'
  config.gem 'rpx_now'

  config.after_initialize do
    # use your own (e.g. from account with all features enabled) or the default
    RPXNow.api_key = (File.exist?('config/rpx_now_api_key') ? File.read('config/rpx_now_api_key').strip : 'dc1ea8b9232b1554a78a99321ebc1f9086df08e7')
  end
end