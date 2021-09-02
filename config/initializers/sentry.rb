Sentry.init do |config|
  config.dsn = nil
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Sent events only for the below environments
  config.enabled_environments = %w[ development staging production ]

  filter = ActiveSupport::ParameterFilter.new(Rails.application.config.filter_parameters)
  config.before_send = lambda do |event, _hint|
    filter.filter(event.to_hash)
  end
end

