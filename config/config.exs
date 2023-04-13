# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

config :iex, default_prompt: ">>>"

# Configures Elixir's Logger
config :logger, level: :info

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :hello_logs, :logger, [
  {:handler, :hello_logs_handler, :syslog_logger_h,
   configuration = %{
     formatter:
       {:jsonlog,
        %{
          json_encode: &Jason.encode!/2,
          template: [{:time, :time}, {:level, :level}, {:pid, :pid}, :msg]
        }}
   }}
]

config :syslog, protocol: {:rfc5424, :tcp}
# use ncat -klt 1513 for testing
config :syslog, dest_port: 1513
config :syslog, app_name: 'hello-logs'
