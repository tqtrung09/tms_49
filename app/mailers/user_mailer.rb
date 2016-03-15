class UserMailer < ApplicationMailer
  def assign_trainee user
    @user = user
    @greeting = t("hi"), @user.name
    mail to: @user.email, subject: t("subject")
  end

  def report_trainee
    @admin =  User.find_by_admin true
    @greeting = t("hi"), @admin.name
    @user_trainees = UserCourse.all
    mail to: @admin.email, subject: t("subject")
  end
end
