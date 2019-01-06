require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
  subject { build(:training_session) }

  describe '#validate' do
    context 'with valid params' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end

  end

end
