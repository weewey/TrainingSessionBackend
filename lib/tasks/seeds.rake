namespace :seed do
  namespace :july do
    desc 'Create a test user for use in development'
    task add_sessions: :environment do
      week_one = [['6/8/2018', 'easy', 'PM', 15, 'go easy'],
                  ['7/8/2018', 'easy', 'PM', 20, 'one or two runs'],
                  ['8/8/2018', 'easy', 'PM', 16, 'go easy'],
                  ['9/8/2018', 'interval', 'PM', 19, '3K warm up, 2 sets of 1600 in 6:00, 1200 in 4:25, 800 in 2:55, 400 in :80-:82. 400 meter recoveries between each. 3K warm down'],
                  ['10/8/2018', 'easy', 'PM', 12, 'go easy'],
                  ['11/8/2018', 'easy', 'PM', 20, 'Gym session/run'],
                  ['12/8/2018', 'easy', 'PM', 35, 'last 10K no slower than 5:00 per K pace']]
      results = week_one.map do |session|
        TrainingSession.create(
          date: session[0],
          run_type: session[1],
          time_of_day: session[2],
          distance_in_km: session[3],
          coach_comments: session[4]
        )
        puts results
      end
    end
  end
end