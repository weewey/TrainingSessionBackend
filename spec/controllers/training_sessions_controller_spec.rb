require 'rails_helper'

RSpec.describe TrainingSessionsController, type: :controller do
  describe 'GET #show' do
    let(:date) { Date.today.strftime('%d/%m/%Y') }

    before do
      allow(TrainingSession).to receive(:where).with(date: '01/01/2001').and_return([training_session])
    end

    context 'when the trainingSession is not updated with my feedback and workout pace' do
      let(:training_session) { create(:training_session, date: date, distance_in_km: 20, coach_comments: 'test') }
      let(:expected_training_sessions_response) do
        { trainingSessions: [{ id: training_session.id,
                               date: date,
                               distanceInKm: training_session.distance_in_km,
                               timeOfDay: training_session.time_of_day,
                               coachComments: training_session.coach_comments,
                               type: training_session.run_type }] }.to_json
      end

      it 'returns the expected training_sessions' do
        get :show, params: { date: '01/01/2001' }
        expect(response.body).to eq(expected_training_sessions_response)
      end

      context 'when the trainingSession type is in snake_case' do
        let(:training_session_uuid) { SecureRandom.uuid }
        let(:expected_training_sessions_response) do
          { trainingSessions: [{ id: training_session_uuid,
                                 date: '01/01/2001',
                                 distanceInKm: 20.0,
                                 timeOfDay: 'AM',
                                 coachComments: 'test',
                                 type: 'longRun' }] }.to_json
        end
        let(:training_session) { build(:training_session, id: training_session_uuid, run_type: 'long_run', date: '01/01/2001', distance_in_km: 20, coach_comments: 'test') }

        it 'should convert it to camelCase' do
          get :show, params: { date: '01/01/2001' }
          expect(response.body).to eq(expected_training_sessions_response)
        end
      end
    end

    context 'when the trainingSession is updated with feedback, workout pace, heart rate and duration' do
      let(:training_session) { create(:training_session, :with_feedback, date: date) }
      let(:expected_training_sessions_response) do
        { trainingSessions: [{ id: training_session.id,
                               date: date,
                               distanceInKm: training_session.distance_in_km,
                               timeOfDay: training_session.time_of_day,
                               coachComments: training_session.coach_comments,
                               duration: training_session.duration,
                               feedback: training_session.feedback,
                               heartRate: training_session.heart_rate,
                               executedWorkoutPace: training_session.executed_workout_pace,
                               type: training_session.run_type
                             }] }.to_json
      end

      it 'returns the expected training_sessions' do
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
      let(:invalid_training_session_attributes) { attributes_for(:training_session, :invalid_date) }

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

  describe 'POST #CREATE' do
    context 'with valid attributes' do
      let(:valid_attributes) { 
        attributes_for(:training_session,
                                              coach_comments: 'testing create method with valid session attr') }

      it 'save the training session' do
        post :create, params: { training_session: valid_attributes }
        expect(TrainingSession.where(coach_comments:  valid_attributes[:coach_comments])).not_to be_empty
      end

      it 'returns 201' do
        post :create, params: { training_session: valid_attributes }
        expect(response.status).to eq(201)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { 
        attributes_for(:training_session, :invalid_date,
                                                coach_comments: 'testing create method with invalid session atr').except(:id) }

      it 'does not save the training session' do
        post :create, params: { training_session: invalid_attributes }
        expect(TrainingSession.where(coach_comments:  invalid_attributes[:coach_comments])).to be_empty
      end

      it 'returns 400' do
        post :create, params: { training_session: invalid_attributes }
        expect(response.status).to eq(400)
      end
    end
  end
end
