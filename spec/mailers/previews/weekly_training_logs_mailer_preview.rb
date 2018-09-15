# Preview all emails at http://localhost:3000/rails/mailers/weekly_training_logs_mailer
class WeeklyTrainingLogsMailerPreview < ActionMailer::Preview

  def weekly_summary_email
    end_of_week = Date.today.sunday.strftime('%d/%m/%Y')
    beginning_of_week = Date.today.monday.strftime('%d/%m/%Y')
    WeeklyTrainingLogsMailer.weekly_summary_email(beginning_of_week, end_of_week)
  end

end
