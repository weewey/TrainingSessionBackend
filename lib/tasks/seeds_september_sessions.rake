namespace :seed do
  namespace :september do
    task add_sessions: :environment do
      september_sessions = [{ date: "3/9/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                            { date: "4/9/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "Easy run (1 or 2 runs)" },
                            { date: "5/9/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                            { date: "6/9/2018", time_of_day: "PM", distance_in_km: "17", run_type: "interval", coach_comments: "2-3K warm up, 8 X 1K with 400 meter jog recoveries.  Start at 3:56 and cut down 3 seconds per rep. 3:56, 3:53, 3:50, 3:47, 3:44, 3:41, 3:38, 3:35. 2-3 K warm down" },
                            { date: "7/9/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                            { date: "8/9/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "Run and gym session" },
                            { date: "9/9/2018", time_of_day: "AM", distance_in_km: "35", run_type: "long_run", coach_comments: "Easy run" },
                            { date: "10/9/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                            { date: "11/9/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "Easy run (1 or 2 runs)" },
                            { date: "12/9/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                            { date: "13/9/2018", time_of_day: "PM", distance_in_km: "19", run_type: "tempo_run", coach_comments: "2-3K warm up. Progressive tempo. 7K at 4:30 per K, then straight to 1K at 4:20 per K, 1K at 4;15 per K, 1K at 4:10 per K, 1K at 4:05 per K, 1K at 4:00 per K, 1K at 3:55 per K. 2K warm down.  The goal is to run each of the progressive K splits faster than the one before, even if it's only by a second. The 5 seconds per K is a guideline. This workout teaches you concentration and focus while dealing with physical fatigue." },
                            { date: "14/9/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                            { date: "15/9/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "run and gym session" },
                            { date: "16/9/2018", time_of_day: "AM", distance_in_km: "30", run_type: "long_run", coach_comments: "Long run! No slower than 5:00 per K." },
                            { date: "17/9/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run. Follow with 5 X 75 meter strides. Fast but relaxed." },
                            { date: "18/9/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "Easy run. 1 or 2 runs" },
                            { date: "19/9/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "easy run" },
                            { date: "20/9/2018", time_of_day: "PM", distance_in_km: "15.6", run_type: "interval", coach_comments: "2-3K warm up. 12 X 400 meters with 400 jog recoveries. First 4 at :88, next 4 at :85-:86, last 4 at :82-:83. 2-3K warm down" },
                            { date: "21/9/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                            { date: "22/9/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "Run and gym session" },
                            { date: "23/9/2018", time_of_day: "AM", distance_in_km: "35", run_type: "easy", coach_comments: "Long run with last 5K 4:30K pace or faster." },
                            { date: "24/9/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                            { date: "25/9/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "Easy run. 1 or 2 runs" },
                            { date: "26/9/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                            { date: "27/9/2018", time_of_day: "PM", distance_in_km: "18", run_type: "interval", coach_comments: "2-3K warm up. 6 x 1600 with 400 meter jog recoveries. Start at 6:08 and cut down 2 seconds per rep. 6:08, 6:06, 6:04, 6:02, 6:00, 5:58. 2-3K warm down" },
                            { date: "28/9/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                            { date: "29/9/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "Run plus gym session" },
                            { date: "30/9/2018", time_of_day: "AM", distance_in_km: "30", run_type: "long_run", coach_comments: "Long run" }]
      results = september_sessions.map do |session|
        training_session = TrainingSession.create(
          date: session[:date],
          run_type: session[:run_type],
          time_of_day: session[:time_of_day],
          distance_in_km: session[:distance_in_km],
          coach_comments: session[:coach_comments],
        )
        [training_session.persisted?, training_session.id]
      end
      saved_sessions = results.select { |session| session[0] }
      failed_sessions = results - saved_sessions
      puts "Total saved Septemember training sessions: #{saved_sessions.length}"
      puts "Failed training sessions: #{failed_sessions}"
    end
  end
end