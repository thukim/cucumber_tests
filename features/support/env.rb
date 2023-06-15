require 'byebug'


InstallPlugin do |config|
  $retried_times = 0
  config.filters << CustomRetry.new(config)
end
