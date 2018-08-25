require 'rails_helper'

RSpec.describe TrainingSession, type: :model do

  describe '#validate' do
    subject { build(:training_session) }

    context 'with valid params' do
      it 'is valid' do
        expect(subject).to be_valid
      end
    end
  end

end
