class MyJob < ApplicationJob
  def perform
    Rails.logger.info "Performing the job."
    Rails.logger.info Sentry.configuration
    Sentry.capture_message("Explicit error from job")
    raise "foo"
    Rails.logger.info "Finished performing the job."
  end
end
