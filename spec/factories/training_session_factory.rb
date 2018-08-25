FactoryBot.define do
  factory :training_session do
    time_of_day { :AM }
    run_type { :easy }
    date { '01/01/2011' }
    distance_in_km { 20 }
    coach_comments { 'test' }
  end
end