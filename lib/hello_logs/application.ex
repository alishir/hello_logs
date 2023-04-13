defmodule HelloLogs.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: HelloLogs.Worker.start_link(arg)
      # {HelloLogs.Worker, arg}
    ]

    add_syslog_handler()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloLogs.Supervisor]

    Logger.info(%{msg: "TEST MESSAGE TEST MESSGAGE"})

    Supervisor.start_link(children, opts)
  end

  defp add_syslog_handler do
    case :logger.add_handlers(:hello_logs) do
      :ok ->
        # remove syslog default handler
        # https://github.com/schlagert/syslog#otp-21-logger-integration
        :logger.remove_handler(:syslog)

      _ ->
        IO.puts("could not install syslog handler for abr_let")
        Logger.warn("could not install syslog handler for abr_let")
    end
  end
end
