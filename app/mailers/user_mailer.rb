class UserMailer < ApplicationMailer
  def assign_trainee user
    @user = user
    @greeting = t("hi"), @user.name
    mail to: @user.email, subject: t("subject")
  end
end
