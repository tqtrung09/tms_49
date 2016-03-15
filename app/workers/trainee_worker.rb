class TraineeWorker
  include Sidekiq::Worker
  def perform user_ids
    users = User.where id: user_ids
    users.each do |user|
      UserMailer.assign_trainee(user).deliver_now
    end
  end
end
