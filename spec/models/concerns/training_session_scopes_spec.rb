require 'rails_helper'

RSpec.describe TrainingSessionScopes do
  let(:from_date) { Date.yesterday.strftime('%d/%m/%Y') }
  let(:to_date) { Date.today.strftime('%d/%m/%Y') }
  let(:yesterday_am_session) { create(:training_session, date: from_date, time_of_day: 'AM') }
  let(:today_pm_session) { create(:training_session, date: to_date, time_of_day: 'PM') }

  context 'between_date' do
    it 'returns the sessions between the date' do
      expect(TrainingSession.between_date(from_date, to_date)).to include(yesterday_am_session, today_pm_session)
    end
  end
end