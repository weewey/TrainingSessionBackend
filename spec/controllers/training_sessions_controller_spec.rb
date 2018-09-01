require 'rails_helper'

RSpec.describe TrainingSessionsController, type: :controller do
  describe 'GET #show' do
    let(:date) { Date.today.strftime('%d/%m/%Y') }
    let(:training_session) { create(:training_session, date: date, distance_in_km: 20, coach_comments: 'test') }
    let(:expected_training_sessions_response) do
      { trainingSessions: [{ id: training_session.id,
                             date: date,
                             distanceInKm: training_session.distance_in_km,
                             timeOfDay: training_session.time_of_day,
                             coachComments: training_session.coach_comments,
                             type: training_session.run_type }] }.to_json
    end

    before do
      allow(TrainingSession).to receive(:where).with(date: '01/01/2001').and_return([training_session])
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

  describe 'PUT #update' do
    let(:training_session) { create(:training_session) }
    context 'with valid update params' do
      let(:executed_training_session_attributes) { training_session.attributes.merge('heart_rate' => 140) }

      it 'updates the training session' do
        put :update, params: { id: training_session.id, training_session: executed_training_session_attributes }
        training_session.reload
        expect(training_session.heart_rate).to eq(140)
      end

      it 'returns 200' do
        put :update, params: { id: training_session.id, training_session: executed_training_session_attributes }
        expect(response.status).to eq(200)
      end
    end

    context 'with invalid update params' do
      let(:invalid_training_session_attributes) { training_session.attributes.merge('date' => '1/1/1111') }

      it 'does NOT perform the update' do
        put :update, params: { id: training_session.id, training_session: invalid_training_session_attributes }
        training_session.reload
        expect(training_session.date).not_to eq(Date.new(1111, 1, 1))
      end

      it 'returns 400' do
        put :update, params: { id: training_session.id, training_session: invalid_training_session_attributes }
        expect(response.status).to eq(400)
      end
    end
  end
end
