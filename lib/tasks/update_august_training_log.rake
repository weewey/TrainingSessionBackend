namespace :update_log do
  namespace :august do
    desc 'Create a test user for use in development'
    task update: :environment do
      august_logs = [{ date: '6/8/2018', time_of_day: 'PM', distance_in_km: 15, feedback: 'easy run on treadmill',
                       duration: 75, executed_workout_pace: '4:53min/km', heart_rate: 136 },
                     { date: '7/8/2018', time_of_day: 'PM', distance_in_km: 20, feedback: 'easy run on treadmill',
                       duration: 100, executed_workout_pace: '5:00min/km', heart_rate: 140 },
                     { date: '8/8/2018', time_of_day: 'PM', distance_in_km: 16, feedback: 'easy run on treadmill',
                       duration: 80, executed_workout_pace: '5:00min/km', heart_rate: 138 },
                     { date: '9/8/2018', time_of_day: 'PM', distance_in_km: 16,
                       feedback: 'Workout done on a treadmill, felt good. It was comfortably hard.',
                       duration: 80, executed_workout_pace: '1st round: (1600: 5:57, 1200: 4:23, 800: 2:53, 400: 1:23),
                      2nd round: (1600: 5:55, 1200: 4:24, 800: 2:52, 400: 1:21)', heart_rate: 163 },
                     { date: '10/8/2018', time_of_day: 'PM', distance_in_km: 12, feedback: 'easy run on treadmill',
                       duration: 80, executed_workout_pace: '5:50min/km', heart_rate: 142 },
                     { date: '11/8/2018', time_of_day: 'PM', distance_in_km: 20, feedback: 'easy run on treadmill',
                       duration: 105, executed_workout_pace: '5:15min/km', heart_rate: 146 },
                     { date: '12/8/2018', time_of_day: 'AM', distance_in_km: 35, feedback: 'easy run',
                       duration: 152, executed_workout_pace: '13k: 60mins, 7k: 31mins, 8.5: 36mins, 6.5k: 25mins',
                       heart_rate: 150 },

                     { date: '13/8/2018', time_of_day: 'PM', distance_in_km: 14, feedback: 'easy run',
                       duration: 80, executed_workout_pace: '5:03min/km', heart_rate: 148 },
                     { date: '14/8/2018', time_of_day: 'PM', distance_in_km: 20, feedback: 'easy run on treadmill',
                       duration: 100, executed_workout_pace: '5:00min/km', heart_rate: 145 },
                     { date: '15/8/2018', time_of_day: 'PM', distance_in_km: 15, feedback: 'easy run on treadmill',
                       duration: 78, executed_workout_pace: '5:13min/km', heart_rate: 138 },
                     { date: '16/8/2018', time_of_day: 'PM', distance_in_km: 15, feedback: 'easy run on treadmill, did workout on Friday as I was not feeling good',
                       duration: 80, executed_workout_pace: '5:20min/km', heart_rate: 137 },
                     { date: '17/8/2018', time_of_day: 'PM', distance_in_km: 18, feedback: 'Workout felt hard at the last part with 3:55min/km and 3:50min/km, but I could still hit the pace ',
                       duration: 86, executed_workout_pace: '5K: 23:08, 3K: 12:27, 1K: 4:19, 1K: 4:17, 1K: 4:05, 1K: 3:56, 1K: 3:46',
                       heart_rate: 167 },
                     { date: '18/8/2018', time_of_day: 'AM', distance_in_km: 20, feedback: 'easy run',
                       duration: 112, executed_workout_pace: '5:28min/km', heart_rate: 141 },
                     { date: '19/8/2018', time_of_day: 'AM', distance_in_km: 25, feedback: 'went easy for the long run',
                       duration: 130, executed_workout_pace: '5:12min/km', heart_rate: 145 },

                     { date: '20/8/2018', time_of_day: 'PM', distance_in_km: 16, feedback: 'easy run',
                       duration: 81, executed_workout_pace: '5:03min/km', heart_rate: 150 },
                     { date: '21/8/2018', time_of_day: 'PM', distance_in_km: 13, feedback: 'felt strong during the workout',
                       duration: 70, executed_workout_pace: '6 x 800m: (2:52, 2:52, 2:54, 2:52, 2:51, 2:48)',
                       heart_rate: 157 },
                     { date: '22/8/2018', time_of_day: 'PM', distance_in_km: 12, feedback: 'easy run',
                       duration: 65, executed_workout_pace: '5:25min/km', heart_rate: 140 },
                     { date: '23/8/2018', time_of_day: 'PM', distance_in_km: 11, feedback: 'easy run',
                       duration: 56, executed_workout_pace: '5:17min/km', heart_rate: 142 },
                     { date: '25/8/2018', time_of_day: 'AM', distance_in_km: 7, feedback: 'pre-race shakeout run on treadmill',
                       duration: 38, executed_workout_pace: '5:26min/km', heart_rate: 135 },
                     { date: '26/8/2018', time_of_day: 'AM', distance_in_km: 21, feedback: 'Started the race too fast: 3:40 - 3:45 min/km pace, after 8k I slowed down as I know the pace was not sustainable. After which, I just maintained my pace till the end of race.',
                       duration: 84, executed_workout_pace: '4:01min/km', heart_rate: 168 },

                     { date: '27/8/2018', time_of_day: 'PM', distance_in_km: 10, feedback: 'easy run',
                       duration: 59, executed_workout_pace: '5:38min/km', heart_rate: 140 },
                     { date: '28/8/2018', time_of_day: 'PM', distance_in_km: 16, feedback: 'mid-week long run',
                       duration: 81, executed_workout_pace: '5:08min/km', heart_rate: 146 },
                     { date: '29/8/2018', time_of_day: 'AM', distance_in_km: 9, feedback: 'easy run',
                       duration: 48, executed_workout_pace: '5:15min/km', heart_rate: 139 },
                     { date: '29/8/2018', time_of_day: 'PM', distance_in_km: 8, feedback: 'easy run',
                       duration: 44, executed_workout_pace: '5:56min/km', heart_rate: 136 },
                     { date: '30/8/2018', time_of_day: 'PM', distance_in_km: 14, feedback: 'easy run',
                       duration: 72, executed_workout_pace: '5:15min/km', heart_rate: 137 },
                     { date: '31/8/2018', time_of_day: 'PM', distance_in_km: 21, feedback: 'Workout felt tough, I was still feeling the effects of the 21km race. I did the workout on the roads rather than on track. Road was generally flat with abit of humps.',
                       duration: 98, executed_workout_pace: '800m: (3:06, 3:01, 3:01, 3:01, 3:01, 3:01, 3:03, 3:01, 3:01, 3:03)', heart_rate: 165 },
                     { date: '1/9/2018', time_of_day: 'AM', distance_in_km: 13, feedback: 'easy run',
                       duration: 67, executed_workout_pace: '5:10min/km', heart_rate: 140 },
                     { date: '1/9/2018', time_of_day: 'PM', distance_in_km: 9, feedback: 'easy run',
                       duration: 46, executed_workout_pace: '5:05min/km', heart_rate: 140 },
                     { date: '2/9/2018', time_of_day: 'AM', distance_in_km: 23, feedback: 'Long run, felt dehydrated during the run. Felt harder than it supposed to',
                       duration: 109, executed_workout_pace: '4.46min/km', heart_rate: 164 },
                     { date: '2/9/2018', time_of_day: 'PM', distance_in_km: 7.5, feedback: 'easy run',
                       duration: 38, executed_workout_pace: '5:07min/km', heart_rate: 139 },
      ]
      results = august_logs.map do |session|
        if training_session_exists?(session)
          training_session = TrainingSession.where(date: session[:date]).where(time_of_day: session[:time_of_day]).first
          [training_session.update!(feedback: session[:feedback],
                                    duration: session[:duration],
                                    executed_workout_pace: session[:executed_workout_pace],
                                    heart_rate: session[:heart_rate]), training_session.id]
        else
          [false, session[:date], session[:time_of_day]]
        end
      end
      updated_sessions = results.select { |session| session[0] }
      failed_sessions = results - updated_sessions
      puts "Total updated training sessions: #{updated_sessions.length}"
      puts "Failed training sessions: #{failed_sessions}"
    end
  end
end

def training_session_exists?(session)
  TrainingSession.exists?(date: session[:date], time_of_day: session[:time_of_day])
end