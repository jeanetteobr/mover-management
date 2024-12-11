# Specifies the number of threads per worker.
# Minimum and maximum threads are set using the RAILS_MAX_THREADS environment variable.
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the port that Puma will listen on.
# Render automatically assigns the PORT environment variable.
port ENV.fetch("PORT") { 3000 }

# Specifies the environment Puma will run in.
# Default to "development" if RAILS_ENV is not set.
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the number of workers.
# Render scales the app based on the WEB_CONCURRENCY environment variable.
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying workers.
# This ensures the app loads before forking.
preload_app!

# Allow Puma to be restarted by the `bin/rails restart` command.
plugin :tmp_restart

# Specify the PID file if requested.
pidfile ENV["PIDFILE"] if ENV["PIDFILE"]

# Optional: Activate the Solid Queue supervisor inside Puma for single-server deployments.
plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]
