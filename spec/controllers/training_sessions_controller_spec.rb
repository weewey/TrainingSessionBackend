require 'rails_helper'

RSpec.describe TrainingSessionsController, type: :controller do
  describe 'GET #show' do
    let(:expected_training_sessions_response) do
      { trainingSessions: [{ date: '01/01/2001',
                             distanceInKm: 20,
                             timeOfDay: 'AM',
                             coachComments: 'test',
                             type: 'easy' }] }.to_json
    end
    let(:training_session) { build(:training_session, date: '01/01/2001', distance_in_km: 20, coach_comments: 'test') }

    before do
      allow(TrainingSession).to receive(:where).and_return([training_session])
    end

    it 'returns the expected training_sessions' do
      get :show, params: { date: '01/01/2001' }
      expect(response.body).to eq(expected_training_sessions_response)
    end

    context 'when the trainingSession type is in snake_case' do
      let(:expected_training_sessions_response) do
        { trainingSessions: [{ date: '01/01/2001',
                               distanceInKm: 20,
                               timeOfDay: 'AM',
                               coachComments: 'test',
                               type: 'longRun' }] }.to_json
      end
      let(:training_session) { build(:training_session, run_type: 'long_run', date: '01/01/2001', distance_in_km: 20, coach_comments: 'test') }

      it 'should convert it to camelCase' do
        get :show, params: { date: '01/01/2001' }
        expect(response.body).to eq(expected_training_sessions_response)
      end
    end
  end
end
