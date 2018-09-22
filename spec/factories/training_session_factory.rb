FactoryBot.define do
  factory :training_session do
    id { 'uuid-training-session' }
    time_of_day { :AM }
    run_type { :easy }
    date { Date.today }
    distance_in_km { 20 }
    coach_comments { 'test' }

    trait :with_feedback do
      feedback { 'easy peasy run' }
      duration { 100 }
      executed_workout_pace { '3min/km' }
      heart_rate { 140 }
    end

    trait :invalid_date do
      date { Date.parse('1-1-1111') }
    end
  end
end