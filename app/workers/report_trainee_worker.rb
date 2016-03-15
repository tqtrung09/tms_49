class ReportTraineeWorker
  include Sidekiq::Worker
  def perform
    UserMailer.report_trainee.deliver_now
  end
end
