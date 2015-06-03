app_path = "/home/reserv/apps/reservations"
worker_processes   1
timeout            30
preload_app        true
listen             '/tmp/unicorn.api.sock'
user               'reserv', 'reserv'
working_directory  "#{app_path}/current"
pid                "#{app_path}/tmp/pids/unicorn.pid"
stderr_path        "log/unicorn.log"
stdout_path        "log/unicorn.log"

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end
after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end



# # Force the bundler gemfile environment variable to
# # reference the capistrano "current" symlink
# before_exec do |_|
#   ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
# end
