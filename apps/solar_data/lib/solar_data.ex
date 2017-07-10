defmodule SolarData do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(SolarData.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: SolarData.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
