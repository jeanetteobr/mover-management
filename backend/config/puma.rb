# Puma configuration file

threads_count = ENV.fetch("RAILS_MAX_THREADS", 5).to_i
threads threads_count, threads_count

# Set the port for Puma to listen on
port ENV.fetch("PORT", 3000)

# Set the Rails environment
environment ENV.fetch("RAILS_ENV") { "development" }

# Use worker processes only in non-development environments
if ENV.fetch("RAILS_ENV", "development") != "development"
  workers ENV.fetch("WEB_CONCURRENCY", 2).to_i
  preload_app!
else
  workers 0 # Single-threaded mode in development
end

# Allow Puma to be restarted by `bin/rails restart` command
plugin :tmp_restart

# Optional: specify the PID file if needed
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# Additional plugins (example: Solid Queue, only enabled if the environment variable is set)
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]
