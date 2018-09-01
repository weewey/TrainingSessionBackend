namespace :seed do
  namespace :july do
    desc 'Create a test user for use in development'
    task add_sessions: :environment do
      july_sessions = [['6/8/2018', 'easy', 'PM', 15, 'go easy'],
                       ['7/8/2018', 'easy', 'PM', 20, 'one or two runs'],
                       ['8/8/2018', 'easy', 'PM', 16, 'go easy'],
                       ['9/8/2018', 'interval', 'PM', 17, 'Speed. 3K warm up, 17,2 sets of 1600 in 6:00, 1200 in 4:25, 800 in 2:55, 400 in :80-:82. 400 meter recoveries between each. 3K warm down'],
                       ['10/8/2018', 'easy', 'PM', 12, 'go easy'],
                       ['11/8/2018', 'easy', 'PM', 20, 'Gym session and run'],
                       ['12/8/2018', 'long_run', 'PM', 35, 'easy with last 10K no slower than 5:00 per K pace.'],
                       ['13/8/2018', 'easy', 'PM', 16, 'go easy'],
                       ['14/8/2018', 'easy', 'PM', 20, 'one or two runs'],
                       ['15/8/2018', 'easy', 'PM', 15, 'go easy'],
                       ['16/8/2018', 'tempo_run', 'PM', 14, 'Progression run: 8K at 4:45 per K then drop pace to 4:30 for next K, 4:20 for next K , 4:10 for next K, 4:00 for next K, 3:50 for final K. 2K warm down'],
                       ['17/8/2018', 'easy', 'PM', 12, 'go easy'],
                       ['18/8/2018', 'easy', 'PM', 20, 'Gym session and run'],
                       ['19/8/2018', 'long_run', 'PM', 25, 'go easy. Do not push the pace on this session.'],
                       ['20/8/2018', 'easy', 'PM', 16, 'go easy'],
                       ['21/8/2018', 'interval', 'PM', 14, '3K warm up, 6 X 800 with 400 jog recovery. 3:00, 2:58, 2:56, 2:54, 2:52, 2:50. 3K warm down'],
                       ['22/8/2018', 'easy', 'PM', 12, 'go easy'],
                       ['23/8/2018', 'easy', 'PM', 10, 'go easy'],
                       ['25/8/2018', 'easy', 'PM', 7, 'easy incorporating 3 X 15 second pick ups at 5K pace'],
                       ['26/8/2018', 'race', 'PM', 25, '2 warm up, half marathon race, 2K warm down'],
                       ['27/8/2018', 'easy', 'PM', 10, 'go easy'],
                       ['28/8/2018', 'easy', 'PM', 16, 'one or two runs'],
                       ['29/8/2018', 'easy', 'PM', 10, 'go easy'],
                       ['30/8/2018', 'fartlek', 'PM', 14, 'Fartlek: 15 minute warm up, 10 X 3:00 at 10K race effort with 2 minute recoveries. 15 minute warm down'],
                       ['31/8/2018', 'easy', 'PM', 12, 'go easy'],
                       ['1/9/2018', 'easy', 'PM', 20, 'go easy'],
                       ['2/9/2018', 'long_run', 'PM', 30, 'go easy']]
      results = july_sessions.map do |session|
        training_session = TrainingSession.create(
          date: session[0],
          run_type: session[1],
          time_of_day: session[2],
          distance_in_km: session[3],
          coach_comments: session[4]
        )
        [training_session.persisted?, training_session.id]
      end
      saved_sessions = results.select { |session| session[0] }
      failed_sessions = results - saved_sessions
      puts "Total saved training sessions: #{saved_sessions.length}"
      puts "Failed training sessions: #{failed_sessions}"
    end
  end
end