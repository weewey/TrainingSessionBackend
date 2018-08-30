FactoryBot.define do
  factory :training_session do
    time_of_day { :AM }
    run_type { :easy }
    date { Date.today }
    distance_in_km { 20 }
    coach_comments { 'test' }
  end
end