require 'rails_helper'

RSpec.describe TrainingSessionsController, type: :controller do
  describe 'GET #show' do
    let(:expected_training_sessions_response) do
      { trainingSessions: [{ date: '01/01/2001',
                             distanceInKm: 20,
                             type: 'easy',
                             timeOfDay: 'AM',
                             coachComments: 'test' }] }.to_json
    end
    let(:training_session) do
      build(:training_session, date: '01/01/2001', distance_in_km: 20, coach_comments: :test)
    end

    before do
      allow(TrainingSession).to receive(:where).and_return([training_session])
    end

    it 'returns the expected training_sessions' do
      get :show, params: { date: '01/01/2001' }
      expect(response.body).to eq(expected_training_sessions_response)
    end
  end
end
