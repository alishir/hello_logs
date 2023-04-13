defmodule HelloLogsTest do
  use ExUnit.Case
  doctest HelloLogs

  test "greets the world" do
    assert HelloLogs.hello() == :world
  end
end
