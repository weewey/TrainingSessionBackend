class WeeklyTrainingLogsMailer < ApplicationMailer
  default from: Figaro.env.w_email_username

  def weekly_summary_email(from_date, to_date)
    @sessions = TrainingSession.between_date(from_date, to_date)
    mail(to: Figaro.env.coach_email_address, subject: "Yew Wee Weekly Training Logs - #{from_date} to #{to_date}")
  end
end
