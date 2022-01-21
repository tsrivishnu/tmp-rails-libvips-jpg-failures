class MyJob < ApplicationJob
  def perform
    Rails.logger.info "Performing the job."
    Rails.logger.info "Finished performing the job."
  end
end
