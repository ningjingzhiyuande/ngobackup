Bluepill.application("itbackup") do |app|

  app.process("unicorn") do |process|

    process.uid = gid = "www"
    process.working_dir = RAILS_ROOT
    rails_env = ENV['RAILS_ENV'] || 'production'
    RAILS_ROOT = "/itbackup/web/current/"

    process.pid_file = File.join("itbackup", 'web', 'shared','pids', 'unicorn.pid')
    process.working_dir = RAILS_ROOT

    process.start_command = "cd #{RAILS_ROOT};bundle exec unicorn_rails -D -c #{working_dir}config/unicorn.rb -E #{rails_env}"
    process.stop_command = "kill -QUIT {{PID}}"
    process.restart_command = "kill -USR2 {{PID}}"

   

    process.start_grace_time = 8.seconds
    process.stop_grace_time = 5.seconds
    process.restart_grace_time = 13.seconds

    process.monitor_children do |child_process|
      child_process.stop_command = "kill -QUIT {{PID}}"

      child_process.checks :mem_usage, :every => 10.seconds, :below => 150.megabytes, :times => [3,4], :fires => :stop
      child_process.checks :cpu_usage, :every => 10.seconds, :below => 20, :times => [3,4], :fires => :stop
    end
  end


 
end
