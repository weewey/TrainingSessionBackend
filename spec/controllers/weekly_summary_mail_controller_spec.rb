require 'rails_helper'

RSpec.describe WeeklySummaryMailController, type: :controller do
  describe 'POST #create' do
    let(:from_date) { (Date.today - 7).to_s }
    let(:to_date) { (Date.today).to_s }
    let(:mail) { double(:Mail) }

    before do
      allow(WeeklyTrainingLogsMailer).to receive(:weekly_summary_email).with(from_date, to_date).and_return(mail)
      allow(mail).to receive(:deliver_now)
    end

    it 'delivers the weekly_training_logs mail' do
      expect(WeeklyTrainingLogsMailer).to receive(:weekly_summary_email).with(from_date, to_date).and_return(mail)
      expect(mail).to receive(:deliver_now)
      post :create, params: { from_date: from_date, to_date: to_date }
    end

    it 'returns 200' do
      post :create, params: { from_date: from_date, to_date: to_date }
      expect(response.status).to eq(200)
    end

    context 'when sending the mail fails' do
      let(:response_body) { { 'status' => 'error', 'message' => 'Net::SMTPAuthenticationError' } }

      before do
        allow(WeeklyTrainingLogsMailer).to receive(:weekly_summary_email).with(from_date, to_date).and_raise(Net::SMTPAuthenticationError)
      end

      it 'returns 400 with the error message ' do
        post :create, params: { from_date: from_date, to_date: to_date }
        expect(response.status).to eq(400)
        expect(response.body).to eq(response_body.to_json)
      end

    end
  end
end
