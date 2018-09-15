require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
  subject { build(:training_session) }

  describe '#validate' do
    context 'with valid params' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

    context 'when the year is not the current year' do
      it 'is not valid' do
        subject.date = '1/1/1111'
        expect(subject).to be_invalid
      end
    end
  end

end
