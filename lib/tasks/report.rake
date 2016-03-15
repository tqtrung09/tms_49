namespace :report do
  desc "Report at the end of month"
  task report_end_month: :environment do
    ReportTraineeWorker.perform_async
  end
end
