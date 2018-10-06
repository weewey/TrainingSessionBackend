namespace :seed do
  namespace :october do
    task add_sessions: :environment do
      october_sessions = [{ date: "1/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "2/10/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "(one or two runs)" },
                          { date: "3/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "4/10/2018", time_of_day: "PM", distance_in_km: "15", run_type: "fartlek", coach_comments: "15 mins warm up. 2, 2, 3, 3, 4, 5, 4, 3, 3, 2, 2 minutes at 10K race effort with 2 minute recovery jogs between each interval. 15 mins warm down" },
                          { date: "5/10/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                          { date: "6/10/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "run and gym session" },
                          { date: "7/10/2018", time_of_day: "AM", distance_in_km: "35", run_type: "long_run", coach_comments: "Easy run" },
                          { date: "8/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "9/10/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "(one or two runs)" },
                          { date: "10/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "11/10/2018", time_of_day: "PM", distance_in_km: "18", run_type: "interval", coach_comments: "Warm up 15mins, 5 X 2K with 400 meter recovery jogs. 7:45, 7:40, 7:35, 7:30, 7:25. 2-3K warm down" },
                          { date: "12/10/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                          { date: "13/10/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "and gym session" },
                          { date: "14/10/2018", time_of_day: "AM", distance_in_km: "30", run_type: "long_run", coach_comments: "10K easy, 5K at 4:15 pace, 10K easy, 5K at 4:05 pace" },
                          { date: "15/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "16/10/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "(one or two runs)" },
                          { date: "17/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "18/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "tempo_run", coach_comments: "3K warm up, 10K at 4:00-4:05 pace, 2-3K warm down" },
                          { date: "19/10/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                          { date: "20/10/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "run and gym session" },
                          { date: "21/10/2018", time_of_day: "AM", distance_in_km: "35", run_type: "long_run", coach_comments: "No slower than 5:00 per K pace" },
                          { date: "22/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "23/10/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "(one or two runs)" },
                          { date: "24/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "25/10/2018", time_of_day: "PM", distance_in_km: "13", run_type: "interval", coach_comments: "warm up, 4 sets of (200 meters, 200 jog, 400 meters, 200 jog, 600 meters, 400 jog.) 200s in :37-:40, 400s in :85-:88, 600s in 2:12-2:15. 3K warm down" },
                          { date: "26/10/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                          { date: "27/10/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "run and gym session" },
                          { date: "28/10/2018", time_of_day: "AM", distance_in_km: "30", run_type: "long_run", coach_comments: "last 5K at half marathon race pace" },
                          { date: "29/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "30/10/2018", time_of_day: "PM", distance_in_km: "20", run_type: "easy", coach_comments: "(one or two runs)" },
                          { date: "31/10/2018", time_of_day: "PM", distance_in_km: "16", run_type: "easy", coach_comments: "Easy run" },
                          { date: "1/11/2018", time_of_day: "PM", distance_in_km: "23", run_type: "tempo_run", coach_comments: "10K at 4:30 per K then drop pace to 4:15 and complete 8K while dropping the pace by 3 seconds per K. 4:15, 4:12, 4:09, 4:06, 4:03, 4:00, 3:57, 3:54. 2K warm down" },
                          { date: "2/11/2018", time_of_day: "PM", distance_in_km: "12", run_type: "easy", coach_comments: "Easy run" },
                          { date: "3/11/2018", time_of_day: "AM", distance_in_km: "20", run_type: "easy", coach_comments: "run and gym session" },
                          { date: "4/11/2018", time_of_day: "AM", distance_in_km: "35", run_type: "long_run", coach_comments: "Practice fluids and fueling" }]
      results = october_sessions.map do |session|
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
      puts "Total saved October training sessions: #{saved_sessions.length}"
      puts "Failed training sessions: #{failed_sessions}"
    end
  end
end