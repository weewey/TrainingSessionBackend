require 'rails_helper'

RSpec.describe WeeklyTrainingLogsMailer, type: :mailer do

  describe 'weekly_summary_email' do
    let(:from_date) { Date.today - 7 }
    let(:to_date) { Date.today }
    let(:mail) { WeeklyTrainingLogsMailer.weekly_summary_email(from_date, to_date) }
    let(:first_training_session) { create(:training_session) }
    let(:second_training_session) { create(:training_session) }
    let(:week_training_sessions) { [first_training_session, second_training_session] }

    before do
      allow(TrainingSession).to receive(:between_date).and_return(week_training_sessions)
    end

    it 'renders the headers' do
      expect(mail.subject).to match(/Yew Wee Weekly Training Logs - (#{from_date}) to (#{to_date})/)
      expect(mail.to).to include(Figaro.env.coach_email_address)
      expect(mail.from).to eq([Figaro.env.w_email_username])
    end

  end
end
